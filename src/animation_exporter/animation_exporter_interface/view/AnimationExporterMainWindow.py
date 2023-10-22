import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)
from PySide2 import QtCore, QtWidgets
from PySideWrapper import base_widgets, base_windows
from PySideWrapper import constants, styles, icons, base_layouts
from utility_resources import userSettings
from controller import SettingsController
from . import SettingsView

# TODO: make a widget that holds different items to export -- like a queue

# TODO: Allow for opening multiple file -- open file - get data and store with path -- when exporting reopen files and export


class ExporterMainWindow(base_windows.Main_Window):
    InitializationFinished = QtCore.Signal()

    def finish_initialization(self):
        self.setStyleSheet(styles.maya_widget)

        logger.info(f'Building menubar')
        try:
            _menubar = self.build_menu_bar()
            self.setMenuBar(_menubar)
            logger.info(f'Successfully built and set menu bar')
        except Exception as e:
            logger.error(
                f'Encountered exception while attempting to build and set menu bar')
            logger.exception(e)


        logger.info(f'Building holders for main widgets.')
        try:
            self.header = self.build_main_window_header()
            self.focal_tab_widget = self.build_focal_tab_widget()
            self.footer = self.build_main_window_footer()
            logger.info(f'Successfully built holders for (header, focal_tab_widget, footer) :: {self.header, self.focal_tab_widget, self.footer}')
        except Exception as e:
            logger.error(f'Encountered exception while attempting to build holders for (header, focal_tab_widget, footer) :: {self.header, self.focal_tab_widget, self.footer}')
            logger.exception(e)

        logger.info(f'Building central widget and adding holders')
        try:
            central_layout = base_layouts.VerticalLayout(margins=[10, 0, 10, 0], spacing=5)

            central_layout.addWidget(self.header, alignment=constants.align_top)
            central_layout.addWidget(self.focal_tab_widget)
            central_layout.addWidget(self.footer, alignment=constants.align_bottom)

            logger.info(f'Successfully built central widget and added holders')
        except Exception as e:
            logger.error(f'Encountered exception while attempting to build central widget and add holders :: central_widget {central_layout}')
            logger.exception(e)

        logger.info(f'Setting central widget')
        self.setCentralWidget(central_layout)

        logger.info(f'Resizing window: {self}')
        self.resize(*userSettings.mainWindowSize())

        self.setWindowTitle(f'Animporter')
        self.setWindowIcon(icons.logo)

        logger.info(f'Emitting InitializationFinished signal')
        self.InitializationFinished.emit()


    def __init__(self):
        self.header = None
        self.focal_tab_widget = None
        self.footer = None
        super().__init__()

    def build_menu_bar(self):
        _menu_bar = base_widgets.MenuBar()
        _menu_bar.setStyleSheet(styles.maya_menu_bar)

        _file_menu = _menu_bar.addMenu("&File")

        _settings_action = QtWidgets.QAction(text="Settings", parent=_file_menu)
        _settings_action.setIcon(icons.gear)
        _settings_action.triggered.connect(self.open_settings_window)

        _file_menu.addAction(_settings_action)

        _help_menu = _menu_bar.addMenu("&Help")

        diagnostic_menu = _help_menu.addMenu("&Diagnostic Tools")
        logs_action = QtWidgets.QAction(text="Log Viewer", parent=diagnostic_menu)

        diagnostic_menu.addAction(logs_action)

        return _menu_bar

    def open_settings_window(self):
        logger.info(f"Event triggered to open settings window.")
        _settingController = SettingsController.SettingsController(module='userSettings')
        self._settingView = SettingsView.SettingsEditor(parent=self, margins=10, spacing=7)
        self._settingView.controller = _settingController

        self._settingView.settingDataRequest.connect(_settingController.emitSettings)
        self._settingView.settingsChanged.connect(_settingController.setSettingDictionary)
        self._settingView.resetSettings.connect(_settingController.resetSettings)

        _settingController.settingsDictionary.connect(self._settingView.addSettings)
        _settingController.closeSettings.connect(self._settingView.close)

        self._settingView.finish_initialization()

    def open_log_viewer(self):
        return


    # region #######################| TAB WIDGET STUFF |##########################

    def build_focal_tab_widget(self):
        """
        Builds the focal panels for the window

        Returns
        -------

        """
        _tab_widget = base_layouts.TabWidget()
        _tab_widget.setStyleSheet(styles.maya_tab_widget)
        _tab_widget.setElideMode(QtCore.Qt.ElideLeft)

        # _tab_widget.tabBar().
        return _tab_widget

    @QtCore.Slot()
    def addFocalPanel(self, panel, title):
        self.focal_tab_widget.addTab(panel, title)
    # endregion


    # region #######################| HEADER STUFF |##########################


    def build_main_window_header(self):
        """
        Builds the header

        Returns
        -------

        """
        return base_layouts.VerticalLayout()

    @QtCore.Slot()
    def addHeader(self, panel):
        self.header.clearAndAddWidget(panel)
    # endregion


    # region #######################| FOOTER STUFF |##########################

    def build_main_window_footer(self):
        """
        Builds the footer
        Returns
        -------

        """
        return base_layouts.VerticalLayout()

    @QtCore.Slot()
    def addFooter(self, panel):
        self.footer.clearAndAddWidget(panel)
    # endregion

if __name__ == "__main__":
    import sys

    _app = QtWidgets.QApplication(sys.argv)

    try:
        _window = ExporterMainWindow()
        _window.finish_initialization()
        _window.show()
    except Exception as e:
        print(e)

    sys.exit(_app.exec_())
