import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

import json
import os.path
import local_settings_manager, file_management
from functools import partial
from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import base_widgets, base_layouts, base_windows, constants, styles, proceadural_displays
from animation_exporter.utility_resources import userSettings

attrs = [
    proceadural_displays.BoolComboAttributeEditor,
    proceadural_displays.TextListAttributeEditor,
    proceadural_displays.LineEditAttributeEditor,
    proceadural_displays.TwoDimentionalLineEditAttributeEditor,
]

class SettingsEditor(base_windows.Main_Window):

    settingDataRequest = QtCore.Signal()
    settingValueChanged = QtCore.Signal(str, object)
    settingsChanged = QtCore.Signal(dict)

    resetSettings = QtCore.Signal()
    toggleHiddenSettings = QtCore.Signal(bool)

    def __init__(self, margins=[0, 0, 0, 0], spacing=0, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.margins = margins
        self.spacing = spacing
        self.setWindowTitle('Settings')
        self.resize(*userSettings.settingsWindowSize())

    def finish_initialization(self):

        _centralLayout = base_layouts.VerticalLayout(margins=self.margins, spacing=self.spacing)
        self.scrollArea = base_layouts.VerticalScrollArea()
        self.setCentralWidget(_centralLayout)
        _buttons = self._buildButtons()
        _centralLayout.addWidget(self.scrollArea)
        _centralLayout.addWidget(_buttons, alignment=constants.align_right)

        self.settingDataRequest.emit()
        self.show()
        menuBar = self.build_menu_bar()
        self.setMenuBar(menuBar)

    def addSettings(self, settingsDictionary):
        self.scrollArea.clear_layout()
        self._attribute_mapper = proceadural_displays.AttributeHolder(
            attribute_dictionary=settingsDictionary,
            attribute_mapper=attrs,
            map_by_identity=True,
            map_by_type=False,
            attribute_title_width=250,
            attributes_to_hide=userSettings.settingsToHide(),
            spacing=6,
            margins=6
        )
        self._attribute_mapper.valueChanged.connect(self.settingValueChanged.emit)

        self.scrollArea.addWidget(self._attribute_mapper, stretch=1)

    def _buildButtons(self):
        _layout = base_layouts.HorizontalLayout()
        _layout.addWidgets([self._buildSaveButton(), self._buildCancelButton()])
        return _layout

    def _buildSaveButton(self):
        _button = base_widgets.Button(text='Save')
        _button.clicked.connect(self.saveButtonClicked)
        return _button

    def saveButtonClicked(self):
        print('saved', self._attribute_mapper.attribute_dictionary())
        self.settingsChanged.emit(self._attribute_mapper.attribute_dictionary())
        self.close()

    def _buildCancelButton(self):
        _button = base_widgets.Button(text='Cancel')
        _button.clicked.connect(self.close)
        return _button

    def build_menu_bar(self):
        _menu_bar = base_widgets.MenuBar()
        _menu_bar.setStyleSheet(styles.maya_menu_bar)

        _file_menu = _menu_bar.addMenu("&Edit")

        _settings_action = QtWidgets.QAction(text="Reset Settings", parent=_file_menu)
        _settings_action.triggered.connect(self.resetSettings.emit)

        _hiddenSettingsAction = QtWidgets.QAction(text="Show Hidden Settings", parent=_file_menu)
        _hiddenSettingsAction.triggered.connect(partial(self.visibilityEvent, _hiddenSettingsAction))
        _hiddenSettingsAction.setCheckable(True)
        _hiddenSettingsAction.setChecked(userSettings.showHiddenSettings())
        self.visibilityEvent(_hiddenSettingsAction)

        _file_menu.addAction(_settings_action)
        _file_menu.addAction(_hiddenSettingsAction)

        return _menu_bar

    def visibilityEvent(self, action):
        self._attribute_mapper.setHiddenAttributeVisibility(action.isChecked())
        _hideSettingEntry = self._attribute_mapper.get_attribute_entry(userSettings.showHiddenSettingsKey)
        _hideSettingEntry.setAttributeValue(action.isChecked())

