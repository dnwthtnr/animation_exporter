import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)
from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import base_widgets, base_layouts, base_windows, constants
from animation_exporter.animation_exporter_interface.view import AnimationExporterFooter, AnimationExporterHeader, AnimationExporterSceneView

# TODO: make a widget that holds different items to export -- like a queue
# TODO: Allow for opening multiple file -- open file - get data and store with path -- when exporting reopen files and export


class ExporterMainWindow(base_windows.Main_Window):
    SceneSelectedContentQuery = QtCore.Signal(object)

    SceneItemSelectedDataQuery = QtCore.Signal(object)


    ExportButtonClicked = QtCore.Signal(list, str)

    def __init__(self):
        super().__init__()

    def finish_initialization(self):
        self.header = self.build_main_window_header()

        _focal_panel_holder = self.build_focal_panels()

        self.footer = self.build_main_window_footer()

        central_layout = base_layouts.Vertical_Layout()

        central_layout.addWidget(self.header, alignment=constants.align_top)
        central_layout.addWidget(_focal_panel_holder)
        central_layout.addWidget(self.footer, alignment=constants.align_bottom)

        self.setCentralWidget(central_layout)

        self.resize(500, 450)

    def build_focal_panels(self):
        """
        Builds the focal panels for the window

        Returns
        -------

        """
        self.scene_item_outliner = self.build_scene_item_outliner()

        self.detail_view = self.build_detail_panel()

        _focal_panel_holder = base_layouts.Horizontal_Layout()
        _focal_panel_holder.addWidget(self.scene_item_outliner)
        _focal_panel_holder.addWidget(self.detail_view)

        return _focal_panel_holder


    def build_main_window_header(self):
        """
        Builds the header

        Returns
        -------

        """
        _widget = AnimationExporterHeader.ExporterHeader()
        _widget.SceneSelected.connect(self.SceneSelectedContentQuery.emit)
        return _widget

    def build_main_window_footer(self):
        """
        Builds the footer
        Returns
        -------

        """
        _widget = AnimationExporterFooter.ExporterFooter()
        _widget.ExportButtonClicked.connect(self.emit_export_signal)
        return _widget

    def build_scene_item_outliner(self):
        """
        Builds the scene item outliner

        Returns
        -------

        """
        _widget = AnimationExporterSceneView.ExporterSceneView()
        _widget.ItemSelected.connect(self.SceneItemSelectedDataQuery.emit)
        return _widget

    def build_detail_panel(self):
        _empty = base_widgets.Label("No Details Yet")
        _widget = base_layouts.Vertical_Layout()
        _widget.addWidget(_empty, alignment=constants.align_center)
        return _widget

    @QtCore.Slot()
    def add_detail_panel(self, panel):
        print(panel)
        self.detail_view.clear_layout()
        self.detail_view.addWidget(panel)

    @QtCore.Slot()
    def populate_scene_contents(self, scene_contents):
        """
        Populated the scene item outliner

        Parameters
        ----------
        scene_contents

        Returns
        -------

        """
        logger.debug(f'Received scene contents: {scene_contents}')
        self.scene_item_outliner.populate_item_view(scene_contents)


    @QtCore.Slot()
    def emit_export_signal(self, *args):

        _object = self.scene_item_outliner.current_selection()

        # self.ExportButtonClicked.emit(_object, )

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
