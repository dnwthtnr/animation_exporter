import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

import json
import os.path
import local_settings_manager, file_management
from functools import partial
from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import base_widgets, base_layouts, base_windows, constants, styles, proceadural_displays

attrs = [
    proceadural_displays.BoolComboAttributeEditor,
    proceadural_displays.LineEditAttributeEditor
]

class SettingsEditor(base_windows.Dialog):

    settingDataRequest = QtCore.Signal()
    settingValueChanged = QtCore.Signal(str, object)
    settingsChanged = QtCore.Signal(dict)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        _layout = QtWidgets.QVBoxLayout()
        self.setLayout(_layout)

    def finish_initialization(self):
        self.scrollArea = base_layouts.VerticalScrollArea()
        self.layout().addWidget(self.scrollArea)
        _buttons = self._buildButtons()
        self.layout().addWidget(_buttons, alignment=constants.align_right)
        self.settingDataRequest.emit()
        self.show()

    def addSettings(self, settingsDictionary):
        self.scrollArea.clear_layout()
        self._attribute_mapper = proceadural_displays.AttributeHolder(
            attribute_dictionary=settingsDictionary,
            attribute_mapper=attrs,
            map_by_identity=True,
            map_by_type=False,
            attribute_title_width=250
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

