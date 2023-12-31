from animation_exporter import (
    logger
)

from PySide2 import QtWidgets, QtCore
import sys, multiprocessing

from animation_exporter import animation_exporter_interface, utility_resources


import threading

def build_animation_exporter_window():
    _panel_controller = animation_exporter_interface.controller.panel_controller.PanelController()

    _window = animation_exporter_interface.view.AnimationExporterMainWindow.ExporterMainWindow()
    _window._panel_controller = _panel_controller

    _window.InitializationFinished.connect(_panel_controller.start_construction)

    _panel_controller.HeaderPanelBuilt.connect(_window.addHeader)
    _panel_controller.FooterPanelBuilt.connect(_window.addFooter)
    _panel_controller.FocalPanelBuilt.connect(_window.addFocalPanel)
    _panel_controller.CloseButtonClicked.connect(_window.close)


    return _window


def main():

    _app = QtWidgets.QApplication(sys.argv)

    _thread = QtCore.QThread()

    _window = build_animation_exporter_window()
    _window.moveToThread(_thread)
    _window.finish_initialization()
    _window.show()
    # _win = _uiuThread()
    # _win.start()

    sys.exit(_app.exec_())

if __name__ == "__main__":
    main()
