from animation_exporter import (
    logger
)

from PySide2 import QtWidgets
import sys

from animation_exporter import animation_exporter_interface, utility_resources





def build_animation_exporter_window():
    _panel_controller = animation_exporter_interface.controller.panel_controller.PanelController()

    _window = animation_exporter_interface.view.AnimationExporterMainWindow.ExporterMainWindow()
    _window._panel_controller = _panel_controller

    _window.InitializationFinished.connect(_panel_controller.start_construction)

    _panel_controller.HeaderPanelBuilt.connect(_window.addHeader)
    _panel_controller.FooterPanelBuilt.connect(_window.addFooter)
    _panel_controller.FocalPanelBuilt.connect(_window.addFocalPanel)
    _panel_controller.CloseButtonClicked.connect(_window.close)

    _window.finish_initialization()

    return _window


if __name__ == "__main__":

    _app = QtWidgets.QApplication(sys.argv)

    _window = build_animation_exporter_window()
    _window.show()

    sys.exit(_app.exec_())
