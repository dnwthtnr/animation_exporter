import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

from PySide2 import QtCore, QtWidgets
from functools import partial
from animation_exporter.utility_resources import keys
from pyqt_interface_elements import ( base_layouts, base_widgets,
                                      proceadural_displays, icons,
                                      constants, modal_dialog, styles, line_edits, base_windows )

# TODO: Add widget stuff for active queue items

_collapsed_attributes = [keys.queue_item_export_name]
_attributes_to_hide = [keys.queue_item_index_key]
_non_editable_attributes = []


_attribute_display_classes = [
    proceadural_displays.NameEditorAttributeEditor,
    proceadural_displays.ChooseDirectoryAttributeEditor,
    proceadural_displays.LineEditAttributeEditor
]

# TODO: revise
class NewQueueDialog(base_windows.Dialog):
    accept = QtCore.Signal(str, str)

    def __init__(self, parent=None):
        super().__init__(parent=parent)

        _layout = QtWidgets.QVBoxLayout()
        self.setLayout(_layout)

        self.name_widget = proceadural_displays.LineEditAttributeEditor(attribute_name="Queue Name",
                                                                    attribute_value="newqueuename")
        self.path_widget = proceadural_displays.LineEditAttributeEditor(attribute_name="Queue Path",
                                                                          attribute_value="path")
        _accept_button = base_widgets.Button(text="Accept")
        _accept_button.clicked.connect(self._accept_button_clicked)
        _cancel_button = base_widgets.Button(text="Cancel")
        _cancel_button.clicked.connect(self.close)

        _buttons = base_layouts.HorizontalLayout()
        _buttons.addWidgets([_accept_button, _cancel_button])


        _layout.addWidget(self.name_widget)
        _layout.addWidget(self.path_widget)
        _layout.addWidget(_buttons)

        self.setLayout(_layout)
        self.setWindowModality(QtCore.Qt.ApplicationModal)
        self.setWindowFlag(QtCore.Qt.Tool, True)
    def name(self):
        return self.name_widget.attribute_value

    def path(self):
        return self.path_widget.attribute_value

    def _accept_button_clicked(self):
        self.accept.emit(self.name(), self.path())
        self.close()



class QueueItem(base_layouts.ExpandWhenClicked):
    deleteQueueItem = QtCore.Signal(str)

    changeQueueItemName = QtCore.Signal(str, str)
    changeQueueItemExportDirectory = QtCore.Signal(str, str)
    changeQueueItemIndex = QtCore.Signal(str, str)

    queueItemAttributeChanged = QtCore.Signal(str, object)

    def __init__(self, queue_item_display_dict):
        super().__init__(margins=[5, 5, 0, 0], spacing=5)

        _title_width = 150


        _item_name = queue_item_display_dict.get(keys.queue_item_export_name)
        _item_export_directory = queue_item_display_dict.get(keys.queue_item_export_directory)
        _item_index = queue_item_display_dict.get(keys.queue_item_index_key)

        self._queue_name_widget = proceadural_displays.NameEditorAttributeEditor(
            attribute_name="Export Name",
            attribute_value=_item_name
        )
        self._queue_name_widget.valueEdited.connect(self._change_queue_item_name)

        self._queue_export_directory_widget = proceadural_displays.ChooseDirectoryAttributeEditor(
            attribute_name="Export Directory",
            attribute_value=_item_export_directory
        )
        self._queue_export_directory_widget.valueEdited.connect(self._change_queue_item_export_directory)

        self._queue_index_widget = line_edits.IntLineEdit(value=_item_index)


        # TODO: Make attribute holder for collapsed and expanded widgets. setup method of modularly calling to update
        #  a queue item value and pass the keys.queueitemvaluename to be updated. Have good logging to make clear
        #   _collapsed_display_attributes = {_attr: _value for _attr, _value in queue_item_display_dict.items() if
        #                                    _attr in _collapsed_attributes}
        #   _collapsed_attribute_holder = proceadural_displays.AttributeHolder(
        #       attribute_dictionary=_collapsed_display_attributes,
        #       attribute_mapper=_attribute_display_classes,
        #       map_by_identity=True,
        #       orientation=constants.horizontal
        #   )
        #   _expanded_display_attributes = {_attr: _value for _attr, _value in queue_item_display_dict.items() if
        #                                    _attr not in _collapsed_attributes}
        #   _expanded_attribute_holder = proceadural_displays.AttributeHolder(
        #       attribute_dictionary=_expanded_display_attributes,
        #       attribute_mapper=_attribute_display_classes,
        #       map_by_identity=True,
        #       orientation=constants.horizontal
        #   )
        #   _expanded_attribute_holder.valueChanged.connect(self.queueItemAttributeChanged.emit)
        #   self.addCollapsedWidget(_collapsed_attribute_holder, stretch=1)
        #   self.addCollapsedWidget(_delete_button, alignment=constants.align_right)
        #   self.addExpandedWidget(_expanded_attribute_holder)
        delete_button = self._build_delete_button()

        self.addCollapsedWidget(self._queue_name_widget, stretch=1)
        self.addCollapsedWidget(delete_button, alignment=constants.align_right)

        self.addExpandedWidget(self._queue_export_directory_widget)

        self.set_expanded_stylesheet(styles.maya_expanded_collapsible_layout)
        self.set_collapsed_stylesheet(styles.maya_collapsed_layout)

    def _change_queue_item_name(self, new_name):
        self.changeQueueItemName.emit(self.queue_index(), new_name)
    def _change_queue_item_export_directory(self, new_directory):
        self.changeQueueItemExportDirectory.emit(self.queue_index(), new_directory)
    def _change_queue_index(self, new_index):
        self.changeQueueItemIndex.emit(self.queue_index(), new_index)


    def queue_item_name(self):
        return self._queue_name_widget.attribute_value

    def set_queue_item_name(self, new_name):
        self._queue_name_widget.setAttributeValue(new_name)


    def queue_item_export_directory(self):
        return self._queue_export_directory_widget.attribute_value

    def set_queue_item_export_directory(self, new_directory):
        self._queue_export_directory_widget.setAttributeValue(new_directory)


    def queue_index(self):
        return self._queue_index_widget.text()

    def set_queue_index(self, new_index):
        self._queue_index_widget.setText(new_index)


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

class QueueEditor(base_layouts.VerticalLayout):

    requestingExistingQueueIndex = QtCore.Signal()

    # region Queue Index Signals
    addNewQueue             =   QtCore.Signal(str, str)
    duplicateQueue          =   QtCore.Signal(str)
    deleteQueue             =   QtCore.Signal(object)
    changeQueueName         =   QtCore.Signal(str, str)
    changeQueueDirectory    =   QtCore.Signal(str, str)
    changeQueueIndex        =   QtCore.Signal(str, str)

    changeActiveQueue       =   QtCore.Signal(str)
    # endregion

    # region Active Queue Items Signals
    requestingActiveQueueItems              =   QtCore.Signal()

    deleteActiveQueueItem                   =   QtCore.Signal(str)
    changeActiveQueueItemName               =   QtCore.Signal(str, str)
    changeActiveQueueItemExportDirectory    =   QtCore.Signal(str, str)
    changeActiveQueueItemIndex              =   QtCore.Signal(str, str)
    # endregion

    def finish_initialization(self):
        self.requestingExistingQueueIndex.emit()

    def __init__(self):
        super().__init__()
        self._queue_editor_dialog = self._build_queue_editor_dialog()
        self._queue_selection_combo = self._build_queue_selection_combo()
        queue_manager_toolbar = self._build_queue_management_toolbar(queue_selector=self._queue_selection_combo)

        self._active_queue_item_holder = self._build_active_queue_item_holder()

        self.addWidget(queue_manager_toolbar, alignment=constants.align_top)
        self.addWidget(self._active_queue_item_holder, stretch=1)

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
        _duplicate_queue_button.clicked.connect(self.duplicate_queue_button_clicked)

        _add_queue_button = base_widgets.Tool_Button()
        _add_queue_button.setToolTip(f'Add new queue')
        _add_queue_button.setIcon(icons.checkbox_unchecked)
        _add_queue_button.clicked.connect(self._build_new_queue_dialog)


        _widget = base_layouts.HorizontalLayout()
        _widget.addStretch(1)
        _widget.addWidget(_add_queue_button)
        # _widget.addWidget(_duplicate_queue_button)
        return _widget

    def _build_new_queue_dialog(self):

        _dialog = NewQueueDialog(parent=self)
        _dialog.accept.connect(self.addNewQueue.emit)

        _dialog.show()

    def add_queue_button_clicked(self):
        logger.info(f'Add queue button clicked. Emitting addNewQueue')
        self.addNewQueue.emit()

    def delete_queue_button_clicked(self, queue_index_key):
        logger.info(f'Delete queue button clicked. Emitting deleteQueue {queue_index_key}')
        try:
            self.deleteQueue.emit(queue_index_key)
        except Exception as e:
            raise e

    def duplicate_queue_button_clicked(self):
        self.duplicateQueue.emit()
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

    def active_queue_changed(self):
        self._clear_active_queue_items()
        self.requestingActiveQueueItems.emit

    # endregion

    # region Queue Editing Methods
    def add_queue_index_item(self, queue_name, queue_path, queue_index_key):
        logger.info(f'Received signal to add queue. {queue_name, queue_path, queue_index_key}')
        _item = QueueIndexItem(
            queue_name=queue_name,
            queue_path=queue_path,
            queue_index_key=queue_index_key
        )
        _item.changeQueueName.connect(self.changeQueueName.emit)
        _item.deleteQueue.connect(self.delete_queue_button_clicked)
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




    def _build_active_queue_item_holder(self):
        _widget = base_layouts.VerticalScrollArea()
        _widget.addStretch(1)
        return _widget

    def _clear_active_queue_items(self):
        """
        Removes all queue items from the queue item holder

        """
        self._active_queue_item_holder.clear_layout()

    def add_active_queue_item(self, queue_item_display_dict):
        _item = QueueItem(queue_item_display_dict)

        _item.  deleteQueueItem                   .connect( self.deleteActiveQueueItem.emit                  )
        _item.  changeQueueItemName               .connect( self.changeActiveQueueItemName.emit              )
        _item.  changeQueueItemExportDirectory    .connect( self.changeActiveQueueItemExportDirectory.emit   )
        _item.  changeQueueItemIndex              .connect( self.changeActiveQueueItemIndex.emit             )

        self._active_queue_item_holder.addWidget(_item)

    def delete_active_queue_item(self, queue_index_key):
        """
        Removes the queue item with the given index key from the queue editor and selector

        Parameters
        ----------
        queue_index_key : str
            The queue key that identifies the queue to delete

        """
        _queue_item = self.get_queue_item_from_index(queue_index_key)

        self._active_queue_item_holder.disown_child(_queue_item)

    def get_active_queue_item_from_index(self, queue_item_index_key):
        for _widget in self._queue_item_scroll_area.children():
            if not isinstance(_widget, QueueItem):
                continue

            if _widget.queue_index() == queue_item_index_key:
                return _widget

    def get_active_queue_item_from_name(self, queue_item_name):
        for _widget in self._queue_item_scroll_area.children():
            if not isinstance(_widget, QueueItem):
                continue

            if _widget.queue_item_name() == queue_item_name:
                return _widget

    def change_active_queue_item_name(self, queue_index_key, new_name):
        _queue_item = self.get_queue_item_from_index(queue_index_key)
        _queue_item.set_queue_name(new_name)

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