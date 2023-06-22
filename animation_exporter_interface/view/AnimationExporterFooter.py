
import logging
import os.path

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import base_widgets, base_layouts, base_windows, constants, line_edits
from functools import partial


class ExporterFooter(base_layouts.Horizontal_Layout):
    ExportButtonClicked = QtCore.Signal(str)
    CloseButtonClicked = QtCore.Signal()

    def __init__(self):
        super().__init__()
        self.output_location_selection = None
        self.finish_initialization()

    def finish_initialization(self):
        _button_holder = self.build_button_holder()

        _export_path_holder = self.build_folder_selection_holder()

        self.output_location_selection = self.build_output_location_selector()
        # self.addWidget(_export_path_holder)
        self.addWidget(_button_holder, alignment=constants.align_right)

    @property
    def export_directory(self):
        if self.output_location_selection is not None:
            return self.output_location_selection.directory

    def build_button_holder(self):
        self.export_button = self.build_export_button()
        self.close_button = self.build_close_button()

        _layout = base_layouts.Horizontal_Layout()
        _layout.addWidget(self.close_button)
        return _layout

    def build_export_button(self):
        _button = base_widgets.Button(text="Export")
        _button.clicked.connect(self.emit_export_signal)
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
        _file_picker.textEdited.connect(self.text_updated)
        return _file_picker

    @QtCore.Slot()
    def emit_export_signal(self):
        logger.info(f'Attempting to emit ExportButtonClicked with directory: {self.export_directory}')
        try:
            self.ExportButtonClicked.emit(self.export_directory)
            logger.info(f'Successfully emitted signal ExportButtonClicked with directory: {self.export_directory}')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to emit ExportButtonClicked signal with directory: {self.export_directory}')
            logger.exception(e)

    @QtCore.Slot()
    def text_updated(self, text):
        if not os.path.exists(text):
            # display that it needs to be a path
            return


if __name__ == "__main__":
    import sys

    _app = QtWidgets.QApplication(sys.argv)

    try:
        _window = ExporterFooter()
        _window.show()
    except Exception as e:
        print(e)

    sys.exit(_app.exec_())
