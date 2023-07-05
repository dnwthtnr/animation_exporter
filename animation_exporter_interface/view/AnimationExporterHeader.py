
from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import base_widgets, base_layouts, base_windows, line_edits


class ExporterHeader(base_layouts.HorizontalLayout):
    SceneSelected = QtCore.Signal(object)

    def __init__(self):
        super().__init__()
        self.build_header()

    def build_header(self):
        # self.file_selection_line = self.build_file_picker()
        # self.selection_title_label = self.build_file_label()
        #
        # self.addWidgets([self.selection_title_label, self.file_selection_line])
        return

    def build_file_label(self):
        _label = base_widgets.Label(text="Current Scene: ")
        return _label

    def build_file_picker(self):
        _file_picker = line_edits.File_Selection_Line_Edit("")
        _file_picker.FileSelected.connect(self.SceneSelected.emit)
        return _file_picker