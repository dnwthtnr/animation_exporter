# region Standard Imports
from functools import partial
import os
import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)
# endregion

# region 3rd Party Imports
from PySide2 import QtCore, QtGui
#endregion

# region Local Imports
import constants, base_layouts, base_widgets, icons, buttons, dialogs, visuals
# endregion






class FloatLineEdit(base_widgets.Line_Edit):

    def __init__(self, value=0, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.setValue(value)
        self.setValidator(QtGui.QDoubleValidator())

    def value(self):
        return float(self.text())

    def setValue(self, value):
        self.setText(str(value))

class IntLineEdit(base_widgets.Line_Edit):

    def __init__(self, value=0, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.setValue(value)
        self.setValidator(QtGui.QIntValidator())

    def value(self):
        return float(self.text())

    def setValue(self, value):
        self.setText(str(value))


class File_Selection_Line_Edit(base_layouts.HorizontalLayout):
    FileSelected = QtCore.Signal(str)
    textEdited = QtCore.Signal(str)

    def __init__(self, filepath, extension=None, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.extension = extension
        self.filepath = filepath

        self.build_widget(filepath)

    def build_widget(self, filepath):
        self.line_edit = self.build_lineedit(filepath)
        self.button = self.build_button()

        self.button_holder = base_layouts.HorizontalLayout()
        self.button_holder.addWidget(self.button)

        self.addWidget(self.line_edit)
        self.addWidget(self.button_holder, alignment=constants.align_right)


    def build_lineedit(self, filepath):
        filepath = filepath if os.path.exists(filepath) else ""
        _line_edit = base_widgets.Line_Edit(text=filepath)
        _line_edit.setReadOnly(True)
        _line_edit.textEdited.connect(self.textEdited.emit)
        self.FileSelected.connect(_line_edit.setText)
        return _line_edit

    def set_display_path(self, filepath):
        if os.path.exists(filepath) is False:
            return

        self.line_edit.setText(filepath)

    def build_button(self):
        _button = base_widgets.Tool_Button()
        _button.setStyleSheet("border: none;")
        _button.setIcon(icons.open_file)
        _button.clicked.connect(self.open_file_dialogue)
        return _button

    def open_file_dialogue(self):
        _file_browser = base_windows.File_Dialogue()
        _selection_item = _file_browser.getOpenFileName(
            parent=self,
            caption=("Select Scene"),
            dir="/home",
            # filter=("*.ma, *.mb, *.fbx")
        )
        _selected_file = _selection_item[0]
        logger.debug(f'File selected {_selected_file}')

        if os.path.exists(_selected_file) is False:
            return

        self.filepath = _selected_file
        self.FileSelected.emit(_selected_file)

    def setFileLoadingState(self, loading):
        if loading is True:
            self.button_holder.clear_layout()
            _width = self.button.width()
            self.button_holder.setMaximumWidth(_width)
            self.button_holder.addWidget(visuals.loading_wheel())
            return
        self.button_holder.clear_layout()
        self.button_holder.addWidget(self.button)


class FileSelectOrCreateLineEdit(base_layouts.HorizontalLayout):
    FileSelected = QtCore.Signal(str)
    textEdited = QtCore.Signal(str)

    def __init__(self, filepath, new_file_text="New File", extension=None, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.new_file_text = new_file_text
        self.extension = extension
        self.filepath = filepath

        self.build_widget(filepath)

    def build_widget(self, filepath):
        self.line_edit = self.build_lineedit(filepath)
        self.button = self.build_button()

        self.addWidget(self.line_edit)
        self.addWidget(self.button, alignment=constants.align_right)


    def build_lineedit(self, filepath):
        filepath = filepath if os.path.exists(filepath) else ""
        _line_edit = base_widgets.Line_Edit(text=filepath)
        _line_edit.setReadOnly(True)
        _line_edit.textEdited.connect(self.textEdited.emit)
        self.FileSelected.connect(_line_edit.setText)
        return _line_edit

    def _build_new_button(self, text, extension='.json'):
        _widget = base_widgets.Button(text=text)
        return _widget

    def set_display_path(self, filepath):
        if os.path.exists(filepath) is False:
            return

        self.line_edit.setText(filepath)

    def build_button(self):
        _button = base_widgets.Tool_Button()
        _button.setStyleSheet("border: none;")
        _button.setIcon(icons.open_file)
        _button.clicked.connect(self.open_file_dialogue)
        return _button

    def open_file_dialogue(self):
        _file_browser = base_windows.File_Dialogue()

        _new_button = self._build_new_button(text=self.new_file_text)
        _l = QtWidgets.QVBoxLayout()
        _l.addWidget(_file_browser)
        _l.addWidget(_new_button)

        _file_browser.fileSelected.connect(self._file_selected)

        self._w = QtWidgets.QWidget()
        self._w.setLayout(_l)

        self._w.show()

        # _selection_item = _file_browser.getOpenFileName(
        #     parent=self,
        #     caption=("Select Scene"),
        #     dir="/home",
        #     # filter=("*.ma, *.mb, *.fbx")
        # )
        # _selected_file = _selection_item[0]
        # logger.debug(f'File selected {_selected_file}')
        #
        # if os.path.exists(_selected_file) is False:
        #     return
        #
        # self.filepath = _selected_file
        # self.FileSelected.emit(_selected_file)

    def _file_selected(self, file):
        print(file)


class Folder_Selection_Line_Edit(base_layouts.HorizontalLayout):
    FileSelected = QtCore.Signal(str)
    textEdited = QtCore.Signal(str)

    def __init__(self, directory,  *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.line_edit = None
        self.build_widget(directory)

    @property
    def directory(self):
        return self.line_edit.text()

    def build_widget(self, filepath):
        self.line_edit = self.build_lineedit(filepath)
        self.button = self.build_button()

        self.addWidget(self.line_edit)
        self.addWidget(self.button, alignment=constants.align_right)


    def build_lineedit(self, filepath):
        if filepath is None or not os.path.exists(filepath):
            filepath = ""
        # filepath = filepath if os.path.exists(filepath) else ""
        _line_edit = base_widgets.Line_Edit(text=filepath)
        _line_edit.textEdited.connect(self.textEdited.emit)
        self.FileSelected.connect(_line_edit.setText)
        return _line_edit

    def build_button(self):
        _button = base_widgets.Tool_Button()
        _button.setStyleSheet("border: none;")
        _button.setIcon(icons.open_file)
        _button.clicked.connect(self.open_file_dialogue)
        return _button

    def open_file_dialogue(self):
        _file_browser = base_windows.File_Dialogue()
        _selection_item = _file_browser.getExistingDirectory(
            parent=self,
            caption=("Select Export Directory"),
            dir="/home"
        )
        _selected_file = _selection_item
        logger.debug(f'File selected {_selected_file}')
        self.filepath = _selected_file
        self.FileSelected.emit(_selected_file)

    def set_directory(self, directory):
        self.line_edit.setText(directory)


class TwoDimensionalFloat(base_layouts.HorizontalLayout):
    valueChanged = QtCore.Signal(list)

    def __init__(self, x_val, y_val, seperator="-", *args, **kwargs):
        super().__init__(spacing=5, *args, **kwargs)

        self.x_line = FloatLineEdit(value=x_val)
        self.x_line.setAlignment(constants.align_left)
        self.x_line.textEdited.connect(self.emit_value_changed)

        self.y_line = FloatLineEdit(value=y_val)
        self.y_line.setAlignment(constants.align_left)
        self.y_line.textEdited.connect(self.emit_value_changed)

        self.seperator = base_widgets.Label(text=seperator)

        self.addWidget(self.x_line)
        self.addWidget(self.seperator)
        self.addWidget(self.y_line)

    @property
    def value(self):
        return [self.x_value, self.y_value]

    @property
    def x_value(self):
        return self.x_line.value()

    def set_x_value(self, value):
        self.x_line.setValue(value)

    def emit_value_changed(self, *args):
        self.valueChanged.emit([self.x_value, self.y_value])

    @property
    def y_value(self):
        return self.y_line.value()

    def set_y_value(self, value):
        self.y_line.setValue(value)


class ListToolTipDisplay(base_widgets.Line_Edit):
    seperator = " :: "

    def __init__(self, _list, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.setList(_list)
        self.setAlignment(constants.align_left)
        self.setReadOnly(True)

    def list(self):
        _tooltip_text = self.toolTip()
        _list = _tooltip_text.split(self.seperator)
        return _list

    def setList(self, _list):
        self.setText(f"{len(_list)} Children")
        # self.setToolTip("".join(_list))


class LabelEditor(base_widgets.Label):

    def __init__(self, update_text=False, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.update_text = update_text
        self._line_edit = base_widgets.Line_Edit()

    def enter_editing(self):
        # _rect_local = self.rect()
        #
        # self._line_edit.setGeometry(self.rect())
        #
        # self._line_edit.move(self.mapToGlobal(self.pos()))

        self.setWindowModality(QtCore.Qt.ApplicationModal)
        self._line_edit.setWindowFlag(QtCore.Qt.FramelessWindowHint, True)
        self._line_edit.setWindowFlag(QtCore.Qt.Tool, True)
        self._line_edit.setText(self.text())
        self._line_edit.show()
        return

    def resizeEvent(self, event):
        super().resizeEvent(event)
        self._line_edit.setGeometry(self.rect())
        self._line_edit.move(self.mapToGlobal(self.pos()))

    def moveEvent(self, event):
        event.accept()
        super().moveEvent(event)
        self._line_edit.setGeometry(self.rect())
        self._line_edit.move(self.mapToGlobal(self.pos()))

    def paintEvent(self, arg__1):
        super().paintEvent(arg__1)
        self._line_edit.setGeometry(self.rect())
        self._line_edit.move(self.mapToGlobal(self.pos()))

    def exit_editing(self):
        self._line_edit.hide()
        if self.update_text is True:
            self.setText(self._line_edit.text())
            return

        return self._line_edit.text()

class EditLabel(base_widgets.Line_Edit):

    def __init__(self, textAutoUpdate=False, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._textAutoUpdate = textAutoUpdate
        self.setReadOnly(True)

        self._cacheText = self.text()

    def textAutoUpdate(self):
        """
        Whether the display text will be updated automatically on exit of editing

        Returns
        -------

        """
        return self._textAutoUpdate

    def cacheCurrentText(self):
        self._cacheText = self.text()

    def getCachedText(self):
        return self._cacheText

    def setEditState(self, enabled):
        if enabled is True:
            self.setReadOnly(False)
            self.setWindowModality(QtCore.Qt.ApplicationModal)
            self.cacheCurrentText()
            return

        self.setReadOnly(True)
        self.setWindowModality(QtCore.Qt.NonModal)

        _edited_text = self.text()

        if self.textAutoUpdate() is True:
            self.setText(self.getCachedText())
            return

        self.setText(self.getCachedText())
        return _edited_text

    def setText(self, text):
        super().setText(text)
        self.cacheCurrentText()


class DoubleClickLabel(base_widgets.Line_Edit):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._textAutoUpdate = True
        self.setReadOnly(True)

        self._cacheText = self.text()

    def textAutoUpdate(self):
        """
        Whether the display text will be updated automatically on exit of editing

        Returns
        -------

        """
        return self._textAutoUpdate

    def cacheCurrentText(self):
        self._cacheText = self.text()

    def getCachedText(self):
        return self._cacheText

    def setEditState(self, enabled):
        if enabled is True:
            self.setReadOnly(False)
            self.setWindowModality(QtCore.Qt.ApplicationModal)
            self.cacheCurrentText()
            return

        self.setReadOnly(True)
        self.setWindowModality(QtCore.Qt.NonModal)

        _edited_text = self.text()

        if self.textAutoUpdate() is True:
            self.setText(_edited_text)
            return

        self.setText(self.getCachedText())
        return _edited_text

    def setText(self, text):
        super().setText(text)
        self.cacheCurrentText()

    def mouseDoubleClickEvent(self, event):
        event.accept()
        if self.isReadOnly() is True:
            self.setEditState(True)

        super().mouseDoubleClickEvent(event)

    def keyPressEvent(self, event):
        event.accept()

        if event.key() == QtCore.Qt.Key_Return:
            print('enter')
            self.setEditState(False)
        if event.key() == QtCore.Qt.Key_Escape:
            _cachedText = self.getCachedText()
            self.setEditState(False)
            self.setText(_cachedText)


        super().keyPressEvent(event)


class NameEditor(base_layouts.HorizontalLayout):
    textEdited = QtCore.Signal(str)

    def __init__(self, name):
        super().__init__()
        self._label = self._build_label(name)
        self._button = self._build_button()

        self.addWidget(self._label, stretch=1)
        self.addWidget(self._button)


    def text(self):
        return self._label.getCachedText()

    def setText(self, text):
        self._label.setText(text)


    def _build_label(self, name):
        _widget = EditLabel(text=name, textAutoUpdate=False)
        return _widget

    def _build_button(self):
        _widget = buttons.ToggleIconButton(enabled_icon=icons.close, disabled_icon=icons.edit_text)
        _widget.disabled.connect(self.exit_edit_mode)
        _widget.enabled.connect(self.enter_edit_mode)
        return _widget

    def enter_edit_mode(self):
        self._label.setEditState(True)
        return

    def exit_edit_mode(self):
        _new_name = self._label.setEditState(False)
        print(_new_name)
        _old_name = self._label.text()
        if _new_name == _old_name:
            return

        self._name_change_confirmation(_old_name, _new_name)


    def _name_change_confirmation(self, old_name, new_name):
        self._confirmation_dialogue = dialogs.ConfirmDialogue(
            display_text=f'Are you sure you want to rename {old_name} to {new_name}?'
        )
        self._confirmation_dialogue.confirmed.connect(partial(self.textEdited.emit, new_name))

        self._confirmation_dialogue.show()



class BuildFileName(base_layouts.HorizontalLayout):
    fileNameChosen = QtCore.Signal(str)

    def __init__(self, extensions=['.txt', '.json'], title_text=None, enter_text="Create", enter_icon=QtGui.QIcon(), title_width=100):
        super().__init__()
        self._title_width = title_width
        self._extensions = extensions

        _title_label = self._build_title_label(text=title_text)
        self._enter_button = self._build_enter_button(icon=enter_icon, text=enter_text)
        _name_editor_layout = self._build_name_editor_layout()

        self.setExtensions(extensions)


        self.addWidget(_title_label, alignment=constants.align_left)
        self.addWidget(_name_editor_layout, stretch=1)
        self.addWidget(self._enter_button, alignment=constants.align_right)

    def title_width(self):
        return self._title_width

    def _build_title_label(self, text):
        if text is None:
            return None
        _widget = base_widgets.Label(text=text)
        _widget.setMinimumWidth(self.title_width())
        return _widget

    def _build_name_editor_layout(self):
        self._extension_combo = self._build_extension_combo()
        self._file_name_line = self._build_file_name_line()

        _layout = base_layouts.HorizontalLayout(margins=[0, 0, 10, 0])

        _layout.addWidget(self._file_name_line)
        _layout.addWidget(self._extension_combo, alignment=constants.align_right)
        return _layout

    def _build_extension_combo(self):
        _widget = base_widgets.ComboBox()
        _widget.addItems(self.extensions())
        _widget.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)
        return _widget

    def setExtensions(self, extensions):
        """
        Sets the available file extensions

        Parameters
        ----------
        extensions : list[str]
            list of file extension ['.txt', '.json', '.ect']

        """
        if not isinstance(extensions, list):
            raise TypeError(f'Given extensions value must be of type: list not {type(extensions)}')

        self._extension_combo.clear()
        self._extension_combo.addItems(extensions)

        if len(extensions) == 1:
            self._extension_combo.setEnabled(False)
            return

        self._extension_combo.setEnabled(True)

    def _build_file_name_line(self):
        _widget = base_widgets.Line_Edit()
        _widget.setPlaceholderText(f'Enter File Name...')
        _widget.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)
        return _widget

    def _build_enter_button(self, text, icon):
        _widget = base_widgets.Button(text=text, icon=icon)
        _widget.clicked.connect(self._enter_button_clicked)
        _widget.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)
        return _widget

    def _enter_button_clicked(self):
        _extension = self._extension_combo.currentText()
        _filename = self._file_name_line.text()

        filename = _filename + _extension
        self.fileNameChosen.emit(filename)

    def extensions(self):
        return self._extensions


if __name__ == "__main__":
    import base_windows
    import sys
    from PySide2 import QtWidgets


    _app = QtWidgets.QApplication(sys.argv)
    _view = DoubleClickLabel(text='text')

    # _win = base_windows.Main_Window()
    # _win.setCentralWidget(_view)
    _view.show()

    sys.exit(_app.exec_())
