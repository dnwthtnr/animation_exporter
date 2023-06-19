import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)
from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import base_widgets, base_layouts, base_windows, constants

# TODO: make a widget that holds different items to export -- like a queue

# TODO: Allow for opening multiple file -- open file - get data and store with path -- when exporting reopen files and export


class ExporterMainWindow(base_windows.Main_Window):
    InitializationFinished = QtCore.Signal()

    def finish_initialization(self):
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
            central_layout = base_layouts.Vertical_Layout()

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
        self.resize(500, 450)

        logger.info(f'Emitting InitializationFinished signal')
        self.InitializationFinished.emit()


    def __init__(self):
        self.header = None
        self.focal_tab_widget = None
        self.footer = None
        super().__init__()


    # region #######################| TAB WIDGET STUFF |##########################

    def build_focal_tab_widget(self):
        """
        Builds the focal panels for the window

        Returns
        -------

        """
        return base_layouts.TabWidget()

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
        return base_layouts.Vertical_Layout()

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
        return base_layouts.Vertical_Layout()

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
