
import logging
import os.path

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import base_widgets, base_layouts, base_windows, constants, line_edits
from functools import partial


class ExporterQueueDisplay(base_layouts.Vertical_Layout):

    def __init__(self):
        super().__init__()


if __name__ == "__main__":
    import sys

    _app = QtWidgets.QApplication(sys.argv)

    try:
        _window = ExporterQueueDisplay()
        _window.show()
    except Exception as e:
        print(e)

    sys.exit(_app.exec_())
