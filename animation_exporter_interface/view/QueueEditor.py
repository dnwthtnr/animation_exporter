from PySide2 import QtCore
from functools import partial
from pyqt_interface_elements import ( base_layouts, base_widgets,
                                      proceadural_displays, icons,
                                      constants, modal_dialog, styles )

# TODO: Add widget stuff for active queue items

class QueueItem(base_layouts.ExpandWhenClicked):
    deleteQueueItem = QtCore.Signal(str)
    changeQueueItemName = QtCore.Signal(str, str)

    def __init__(self, queue_item_display_dict):
        super().__init__(margins=[5, 5, 0, 0], spacing=5)

        _title_width = 150

        self._queue_index_key = queue_index_key
        self._queue_name = self._build_queue_name(name=queue_name, width=_title_width)
        self._queue_path = self._build_queue_path(path=queue_path, width=_title_width)
        _delete_button = self._build_delete_button()

        self.addCollapsedWidget(self._queue_name, stretch=1)
        self.addCollapsedWidget(_delete_button, alignment=constants.align_right)

        self.addExpandedWidget(self._queue_path)

        self.set_expanded_stylesheet(styles.maya_expanded_collapsible_layout)
        self.set_collapsed_stylesheet(styles.maya_collapsed_layout)

    def queue_index_key(self):
        return self._queue_index_key

    def set_queue_index_key(self, queue_index_key):
        self._queue_index_key = queue_index_key

    def _build_queue_name(self, name, width=None):
        _widget = proceadural_displays.NameEditorAttributeEditor(attribute_name="Export File Name:", attribute_value=name)
        _widget.valueEdited.connect(self.change_queue_name)

        if width is not None:
            _widget.setMinimumWidth(width)

        return _widget

    def queue_name(self):
        return self._queue_name.attribute_value

    def set_queue_name(self, new_name):
        self._queue_name.setAttributeValue(new_name)

    def change_queue_name(self, new_name):
        self.changeQueueName.emit(self.queue_index_key(), new_name)

    def _build_queue_path(self, path, width=None):

        _widget = proceadural_displays.LineEditAttributeEditor(attribute_name="Scene Path:", attribute_value=path)
        # _widget.valueEdited.connect(self.emit_export_name_changed)
        _widget.setReadOnly(True)

        if width is not None:
            _widget.setMinimumWidth(width)

        return _widget

    def queue_path(self):
        return self._queue_path.attribute_value

    def set_queue_path(self, new_queue_path):
        self._queue_path.setAttributeValue(new_queue_path)

    def _build_delete_button(self):
        _widget = base_widgets.Tool_Button()
        _widget.setIcon(icons.close)
        _widget.setToolTip(f"Delete queue")
        _widget.clicked.connect(self._delete_button_clicked)
        return _widget

    def _delete_button_clicked(self):
        self._confirmation_dialogue = modal_dialog.ConfirmDialogue(
            display_text=f'Are you sure you want to delete the "{self.queue_name()}" queue item? \nThe file associated with this queue will also be deleted.',
            parent=self
        )
        self._confirmation_dialogue.confirmed.connect(partial(self.deleteQueue.emit, self.queue_index_key()))

        self._confirmation_dialogue.show()

    def delete_queue(self):
        self.close()

class QueueIndexItem(base_layouts.ExpandWhenClicked):
    deleteQueue = QtCore.Signal(str)
    changeQueueName = QtCore.Signal(str, str)

    def __init__(self, queue_name, queue_path, queue_index_key):
        super().__init__(margins=[5, 5, 0, 0], spacing=5)

        _title_width = 150

        self._queue_index_key = queue_index_key
        self._queue_name = self._build_queue_name(name=queue_name, width=_title_width)
        self._queue_path = self._build_queue_path(path=queue_path, width=_title_width)
        _delete_button = self._build_delete_button()

        self.addCollapsedWidget(self._queue_name, stretch=1)
        self.addCollapsedWidget(_delete_button, alignment=constants.align_right)

        self.addExpandedWidget(self._queue_path)

        self.set_expanded_stylesheet(styles.maya_expanded_collapsible_layout)
        self.set_collapsed_stylesheet(styles.maya_collapsed_layout)

    def queue_index_key(self):
        return self._queue_index_key

    def set_queue_index_key(self, queue_index_key):
        self._queue_index_key = queue_index_key

    def _build_queue_name(self, name, width=None):
        _widget = proceadural_displays.NameEditorAttributeEditor(attribute_name="Export File Name:", attribute_value=name)
        _widget.valueEdited.connect(self.change_queue_name)

        if width is not None:
            _widget.setMinimumWidth(width)

        return _widget

    def queue_name(self):
        return self._queue_name.attribute_value

    def set_queue_name(self, new_name):
        self._queue_name.setAttributeValue(new_name)

    def change_queue_name(self, new_name):
        self.changeQueueName.emit(self.queue_index_key(), new_name)

    def _build_queue_path(self, path, width=None):

        _widget = proceadural_displays.LineEditAttributeEditor(attribute_name="Scene Path:", attribute_value=path)
        # _widget.valueEdited.connect(self.emit_export_name_changed)
        _widget.setReadOnly(True)

        if width is not None:
            _widget.setMinimumWidth(width)

        return _widget

    def queue_path(self):
        return self._queue_path.attribute_value

    def set_queue_path(self, new_queue_path):
        self._queue_path.setAttributeValue(new_queue_path)

    def _build_delete_button(self):
        _widget = base_widgets.Tool_Button()
        _widget.setIcon(icons.close)
        _widget.setToolTip(f"Delete queue")
        _widget.clicked.connect(self._delete_button_clicked)
        return _widget

    def _delete_button_clicked(self):
        self._confirmation_dialogue = modal_dialog.ConfirmDialogue(
            display_text=f'Are you sure you want to delete the "{self.queue_name()}" queue item? \nThe file associated with this queue will also be deleted.',
            parent=self
        )
        self._confirmation_dialogue.confirmed.connect(partial(self.deleteQueue.emit, self.queue_index_key()))

        self._confirmation_dialogue.show()

    def delete_queue(self):
        self.close()

class QueueEditor(base_layouts.HorizontalLayout):
    requestingExistingQueueIndex = QtCore.Signal()

    addNewQueue = QtCore.Signal()
    duplicateQueue = QtCore.Signal(str)

    deleteQueue = QtCore.Signal(str)
    changeQueueName = QtCore.Signal(str, str)
    changeQueueDirectory = QtCore.Signal(str, str)
    changeQueueIndex = QtCore.Signal(str, str)

    changeActiveQueue = QtCore.Signal(str)

    def finish_initialization(self):
        self.requestingExistingQueueIndex.emit()

    def __init__(self):
        super().__init__()
        self._queue_editor_dialog = self._build_queue_editor_dialog()
        self._queue_selection_combo = self._build_queue_selection_combo()
        queue_manager_toolbar = self._build_queue_management_toolbar(queue_selector=self._queue_selection_combo)

        self.addWidget(queue_manager_toolbar, stretch=1)

    # region Dialog
    def open_queue_editor_dialog(self):
        self._queue_editor_dialog.show()

    def _build_queue_editor_dialog(self):
        _queue_editor_dialog= base_windows.Dialog()
        self._queue_item_scroll_area = base_layouts.VerticalScrollArea()
        self._queue_item_scroll_area.addStretch(1)

        self._queue_editor_toolbar = self._build_queue_editor_toolbar()
        _queue_editor_layout = QtWidgets.QVBoxLayout()
        _queue_editor_layout.addWidget(self._queue_editor_toolbar, alignment=constants.align_top)
        _queue_editor_layout.addWidget(self._queue_item_scroll_area, stretch=1)

        _queue_editor_dialog.setLayout(_queue_editor_layout)
        _queue_editor_dialog.setWindowModality(QtCore.Qt.ApplicationModal)
        _queue_editor_dialog.setWindowFlag(QtCore.Qt.Tool, True)

        return _queue_editor_dialog

    def _build_queue_editor_toolbar(self):
        _duplicate_queue_button = base_widgets.Tool_Button()
        _duplicate_queue_button.setToolTip(f'Duplicate queue')
        _duplicate_queue_button.setIcon(icons.open_file)

        _add_queue_button = base_widgets.Tool_Button()
        _add_queue_button.setToolTip(f'Add new queue')
        _add_queue_button.setIcon(icons.checkbox_unchecked)


        _widget = base_layouts.HorizontalLayout()
        _widget.addStretch(1)
        _widget.addWidget(_add_queue_button)
        _widget.addWidget(_duplicate_queue_button)
        return _widget

    def add_queue_button_clicked(self):
        self.addNewQueue.emit()

    def delete_queue_button_clicked(self):
        self.addNewQueue.emit()
    # endregion

    # region Combo
    def _build_queue_management_toolbar(self, queue_selector):
        _open_editor_button = base_widgets.Tool_Button()
        _open_editor_button.setIcon(icons.open_file)
        _open_editor_button.setToolTip(f'Open queue index editor')
        _open_editor_button.clicked.connect(self.open_queue_editor_dialog)

        _widget = base_layouts.HorizontalLayout()

        _widget.addWidget(queue_selector, stretch=1)
        _widget.addWidget(_open_editor_button, alignment=constants.align_right)

        return _widget


    def _build_queue_selection_combo(self):
        _widget = base_widgets.ComboBox()
        _widget.currentTextChanged.connect(self._current_queue_selection_changed)
        return _widget

    def _current_queue_selection_changed(self, *args):
        _new_selection = self._queue_selection_combo.currentText()
        _queue_item = self.get_queue_item_from_name(_new_selection)
        self.changeActiveQueue.emit(_queue_item.queue_index_key())

    # endregion

    # region Queue Editing Methods
    def add_queue_index_item(self, queue_name, queue_path, queue_index_key):
        _item = QueueIndexItem(
            queue_name=queue_name,
            queue_path=queue_path,
            queue_index_key=queue_index_key
        )
        _item.changeQueueName.connect(self.changeQueueName.emit)
        _item.deleteQueue.connect(self.delete_queue_button_clicked())
        self._queue_item_scroll_area.addWidget(_item)

        self._queue_selection_combo.addItem(queue_name)

    def get_queue_item_from_index(self, queue_index_key):
        for _widget in self._queue_item_scroll_area.layout.children:
            if not isinstance(_widget, QueueIndexItem):
                continue

            if _widget.queue_index_key() == queue_index_key:
                return _widget

    def get_queue_item_from_name(self, queue_name):
        for _widget in self._queue_item_scroll_area.layout.children:
            if not isinstance(_widget, QueueIndexItem):
                continue

            if _widget.queue_name() == queue_name:
                return _widget

    def delete_queue_index_item(self, queue_index_key):
        """
        Removes the queue item with the given index key from the queue editor and selector

        Parameters
        ----------
        queue_index_key : str
            The queue key that identifies the queue to delete

        """
        _queue_item = self.get_queue_item_from_index(queue_index_key)

        # remove from combo
        _queue_combo_index = self._queue_selection_combo.findText(_queue_item.queue_name())
        self._queue_selection_combo.removeItem(_queue_combo_index)

        _queue_item.delete_queue()

    def change_queue_index_item_name(self, queue_index_key, new_name):
        _queue_item = self.get_queue_item_from_index(queue_index_key)
        _queue_item.set_queue_name(new_name)

        # add to combo
        _queue_combo_index = self._queue_selection_combo.findText(_queue_item.queue_name())
        self._queue_selection_combo.removeItem(_queue_combo_index)
        self._queue_selection_combo.addItem(new_name)

    def change_queue_index_item_path(self, queue_index_key, new_path):
        _queue_item = self.get_queue_item_from_index(queue_index_key)
        _queue_item.set_queue_path(new_path)

    def change_queue_index_item_key(self, queue_index_key, new_index_key):
        _queue_item = self.get_queue_item_from_index(queue_index_key)
        _queue_item.set_queue_index_key(new_index_key)
    # endregion


    # region Active Queue
    def add_active_queue_item(self, queue_item_display_dict):
        _item = QueueIndexItem(
            queue_name=queue_name,
            queue_path=queue_path,
            queue_index_key=queue_index_key
        )
        _item.changeQueueName.connect(self.changeQueueName.emit)
        _item.deleteQueue.connect(self.delete_queue_button_clicked())
        self._queue_item_scroll_area.addWidget(_item)

        self._queue_selection_combo.addItem(queue_name)

    def get_active_queue_item_from_index(self, queue_index_key):
        for _widget in self._queue_item_scroll_area.layout.children:
            if not isinstance(_widget, QueueIndexItem):
                continue

            if _widget.queue_index_key() == queue_index_key:
                return _widget

    def get_active_queue_item_from_name(self, queue_name):
        for _widget in self._queue_item_scroll_area.layout.children:
            if not isinstance(_widget, QueueIndexItem):
                continue

            if _widget.queue_name() == queue_name:
                return _widget

    def delete_active_queue_item(self, queue_index_key):
        """
        Removes the queue item with the given index key from the queue editor and selector

        Parameters
        ----------
        queue_index_key : str
            The queue key that identifies the queue to delete

        """
        _queue_item = self.get_queue_item_from_index(queue_index_key)

        # remove from combo
        _queue_combo_index = self._queue_selection_combo.findText(_queue_item.queue_name())
        self._queue_selection_combo.removeItem(_queue_combo_index)

        _queue_item.delete_queue()

    def change_active_queue_item_name(self, queue_index_key, new_name):
        _queue_item = self.get_queue_item_from_index(queue_index_key)
        _queue_item.set_queue_name(new_name)

        # add to combo
        _queue_combo_index = self._queue_selection_combo.findText(_queue_item.queue_name())
        self._queue_selection_combo.removeItem(_queue_combo_index)
        self._queue_selection_combo.addItem(new_name)

    def change_active_queue_item_export_directory(self, queue_index_key, new_path):
        _queue_item = self.get_queue_item_from_index(queue_index_key)
        _queue_item.set_queue_path(new_path)

    def change_active_queue_item_key(self, queue_index_key, new_index_key):
        _queue_item = self.get_queue_item_from_index(queue_index_key)
        _queue_item.set_queue_index_key(new_index_key)


if __name__ == "__main__":
    from pyqt_interface_elements import base_windows
    import sys
    from animation_exporter.utility_resources import settings
    from PySide2 import QtWidgets


    _app = QtWidgets.QApplication(sys.argv)
    _view = QueueEditor()
    _view.setStyleSheet(styles.maya_detail_view)

    _view.add_queue_index_item("name1", "pathhhh", "1")
    _view.add_queue_index_item("name2", "pathhhh", "12")
    _view.add_queue_index_item("name32", "pat", "7")
    _view.add_queue_index_item("name4444", "h", "5")

    # _win = base_windows.Main_Window()
    # _win.setCentralWidget(_view)
    _view.show()

    sys.exit(_app.exec_())