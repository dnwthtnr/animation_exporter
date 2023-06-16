
from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import base_widgets, base_layouts, base_windows, constants, line_edits


class ExporterFooter(base_layouts.Horizontal_Layout):
    ExportButtonClicked = QtCore.Signal()
    CloseButtonClicked = QtCore.Signal()

    def __init__(self):
        super().__init__()
        self.folder_picker = None
        self.finish_initialization()

    def finish_initialization(self):
        _button_holder = self.build_button_holder()

        _export_path_holder = self.build_folder_selection_holder()

        self.output_location_selection = self.build_output_location_selector()
        self.addWidget(_export_path_holder)
        self.addWidget(_button_holder, alignment=constants.align_right)

    @property
    def export_directory(self):
        return self.folder_picker.filepath

    def build_button_holder(self):
        self.export_button = self.build_export_button()
        self.close_button = self.build_close_button()

        _layout = base_layouts.Horizontal_Layout()
        _layout.addWidgets([self.export_button, self.close_button])
        return _layout

    def build_export_button(self):
        _button = base_widgets.Button(text="Export")
        _button.clicked.connect(self.ExportButtonClicked.emit)
        return _button

    def build_close_button(self):
        _button = base_widgets.Button(text="Close")
        _button.clicked.connect(self.CloseButtonClicked.emit)
        return _button

    def build_folder_selection_holder(self):
        self.folder_picker = self.build_output_location_selector()
        _folder_picker_title_label = self.build_folder_selection_label()

        _layout = base_layouts.Horizontal_Layout()
        _layout.addWidget(_folder_picker_title_label)
        _layout.addWidget(self.folder_picker)
        return _layout

    def build_folder_selection_label(self):
        _label = base_widgets.Label(text="Export Directory: ")
        return _label

    def build_output_location_selector(self):
        _file_picker = line_edits.Folder_Selection_Line_Edit("")
        return _file_picker