from PySide2 import QtWidgets
import sys
from animation_exporter.animation_exporter_interface.view import AnimationExporterMainWindow
from animation_exporter.animation_exporter_interface.controller import scene_controller



def build_animation_exporter_window():

    _scene_controller = scene_controller.Scene_Controller()

    _window = AnimationExporterMainWindow.ExporterMainWindow()
    _window._scene_controller = _scene_controller

    _window.SceneSelectedContentQuery.connect(_scene_controller.open_file)
    _window.SceneItemSelectedDataQuery.connect(_scene_controller.emit_item_detailed_view)

    _scene_controller.SceneContentDataResponse.connect(_window.populate_scene_contents)
    _scene_controller.DetailPanelBuilt.connect(_window.add_detail_panel)

    _window.finish_initialization()

    return _window


if __name__ == "__main__":

    _app = QtWidgets.QApplication(sys.argv)

    _window = build_animation_exporter_window()
    _window.show()

    sys.exit(_app.exec_())
