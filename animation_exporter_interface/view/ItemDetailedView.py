import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)
from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import base_widgets, base_layouts, base_windows, constants
from animation_exporter.animation_exporter_interface.view import AnimationExporterFooter, AnimationExporterHeader, AnimationExporterSceneView


class DetailedViewPanel(base_layouts.Vertical_Layout):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)


    def addSection(self, name, data):
        _label = base_widgets.Label(text=name)
        _data_layout = base_layouts.Vertical_Layout()

        _data = base_widgets.Line_Edit()
        _data.setText(str(data))

        _data_layout.addWidgets([_label, _data])

        self.addWidget(_data_layout)
        return

