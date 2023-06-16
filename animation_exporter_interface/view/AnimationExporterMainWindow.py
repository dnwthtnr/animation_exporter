import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)
from PySide2 import QtCore, QtWidgets, QtGui
from interface_elements import base_widgets, base_layouts, base_windows, constants
from animation_exporter.animation_exporter_interface.view import AnimationExporterFooter, AnimationExporterHeader, AnimationExporterSceneView


class ExporterMainWindow(base_windows.Main_Window):
    SceneSelectedContentQuery = QtCore.Signal(object)

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
        self.scene_view = self.build_scene_contents()

        _focal_panel_holder = base_layouts.Horizontal_Layout()
        _focal_panel_holder.addWidget(self.scene_view)

        return _focal_panel_holder


    def build_main_window_header(self):
        _widget = AnimationExporterHeader.ExporterHeader()
        _widget.SceneSelected.connect(self.SceneSelectedContentQuery.emit)
        return _widget

    def build_main_window_footer(self):
        _widget = AnimationExporterFooter.ExporterFooter()
        return _widget

    def build_scene_contents(self):
        _widget = AnimationExporterSceneView.ExporterSceneView()
        return _widget

    @QtCore.Slot()
    def populate_scene_contents(self, scene_contents):
        logger.debug(f'Received scene contents: {scene_contents}')
        self.scene_view.populate_item_view(scene_contents)
