from PySide2 import QtCore
from functools import partial
from pyqt_interface_elements import ( base_layouts, base_widgets,
                                      proceadural_displays, icons,
                                      constants, modal_dialog, styles )


class QueueItem(base_layouts.ExpandWhenClicked):
    deleteQueue = QtCore.Signal()
    changeQueueName = QtCore.Signal()

    def __init__(self, queue_name, queue_path, queue_index_key):
        super().__init__(margins=[5, 5, 0, 0], spacing=5)

        _title_width = 150

        self._queue_index_key = queue_index_key
        self._queue_name = self._build_queue_name(name=queue_name, width=_title_width)
        self._queue_path = self._build_queue_path(path=queue_path, width=_title_width)
        _queue_delete_button = self._build_delete_button()
        _queue_status_icon = self._build_status_icon()

        self.addCollapsedWidget(self._queue_name)
        self.addCollapsedWidget(_queue_status_icon)
        self.addCollapsedWidget(_queue_delete_button, alignment=constants.align_right)

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
        self.changeQueueName.emit(self._queue_index_key, new_name)


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
        _widget.clicked.connect(self._delete_button_clicked)
        return _widget

    @QtCore.Slot(name="delete_button_clicked")
    def _delete_button_clicked(self):
        self._confirmation_dialogue = modal_dialog.ConfirmDialogue(
            display_text=f'Are you sure you want to delete the "{self.queue_name()}" queue item? \nThe file associated with this queue will also be deleted.'
        )
        self._confirmation_dialogue.confirmed.connect(self.delete_queue)

        self._confirmation_dialogue.show()

    def delete_queue(self):
        self.close()

class QueueEditor(base_layouts.VerticalLayout):
    requestingExistingQueueList = QtCore.Signal()
    addNewQueue = QtCore.Signal()
    addQueueFromDisk = QtCore.Signal()
    deleteQueue = QtCore.Signal()
    changeQueueName = QtCore.Signal()
    changeQueueDirectory = QtCore.Signal()


    def finish_initialization(self):
        self.requestingExistingQueueList.emit()

    def __init__(self):
        super().__init__()

        self._queue_item_scroll_area = base_layouts.VerticalScrollArea()

        self._toolbar = self._build_toolbar()

        self.addWidget(self._toolbar, alignment=constants.align_top)
        self.addWidget(self._queue_item_scroll_area, stretch=1)

    def add_queue_index_item(self, queue_name, queue_path, queue_index_key):
        _item = QueueItem(
            queue_name=queue_name,
            queue_path=queue_path,
            queue_index_key=queue_index_key
        )
        self._queue_item_scroll_area.addWidget(_item)

    def get_queue_item_from_index(self, queue_index_key):
        for _widget in self._queue_item_scroll_area.layout.children:
            if not isinstance(_widget, QueueItem):
                continue

            if _widget.queue_index_key() == queue_index_key:
                return _widget

    def change_queue_index_item_name(self, queue_index_key, new_name):
        _queue_item = self.get_queue_item_from_index(queue_index_key)
        _queue_item.set_queue_name(new_name)

    def change_queue_index_item_path(self, queue_index_key, new_path):
        _queue_item = self.get_queue_item_from_index(queue_index_key)
        _queue_item.set_queue_path(new_path)

    def change_queue_index_item_key(self, queue_index_key, new_index_key):
        _queue_item = self.get_queue_item_from_index(queue_index_key)
        _queue_item.set_queue_index_key(new_index_key)






if __name__ == "__main__":
    from pyqt_interface_elements import base_windows
    import sys
    from animation_exporter.utility_resources import settings
    from PySide2 import QtWidgets


    _app = QtWidgets.QApplication(sys.argv)
    _view = QueueItem("name", "path", "7")

    # _win = base_windows.Main_Window()
    # _win.setCentralWidget(_view)
    _view.show()

    sys.exit(_app.exec_())