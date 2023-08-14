from PySide2 import QtCore
from pyqt_interface_elements import ( base_layouts, base_widgets,
                                      proceadural_displays, icons,
                                      constants, modal_dialog, styles )


class QueueItem(base_layouts.ExpandWhenClicked):
    deleteQueue = QtCore.Signal()
    changeQueueName = QtCore.Signal()

    def __init__(self, queue_name, queue_path):
        super().__init__(margins=[5, 5, 0, 0], spacing=5)

        _title_width = 150

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

    def _build_queue_name(self, name, width=None):
        _widget = proceadural_displays.LineEditAttributeEditor(attribute_name="Export File Name:", attribute_value=name)
        _widget.valueEdited.connect(self._queue_name_changed)

        if width is not None:
            _widget.setMinimumWidth(width)

        return _widget

    def queue_name(self):
        return self._queue_name.attribute_value

    def _queue_name_changed(self, newname):
        _name = self.queue_name()
        self.changeQueueName.emit(_oldname, _newname)


    def _build_queue_path(self, path, width=None):

        _widget = proceadural_displays.LineEditAttributeEditor(attribute_name="Scene Path:", attribute_value=path)
        # _widget.valueEdited.connect(self.emit_export_name_changed)
        _widget.setReadOnly(True)

        if width is not None:
            _widget.setMinimumWidth(width)

        return _widget

    def queue_path(self):
        return self._queue_path.attribute_value

    def _build_status_icon(self):

        _widget = base_layouts.HorizontalLayout()
        return _widget


    def addStatusIcon(self, widget):
        self.status_icon.clear_layout()
        self.status_icon.addWidget(widget)


    def _build_delete_button(self):
        _widget = base_widgets.Tool_Button()
        _widget.setIcon(icons.close)
        _widget.clicked.connect(self._delete_button_clicked)
        return _widget

    @QtCore.Slot(name="delete_button_clicked")
    def _delete_button_clicked(self):
        _confirmation_dialogue = modal_dialog.ConfirmDialogue(
            display_text=f'Are you sure you want to delete the "{self.queue_name()}" queue item? The file associated with this queue will also be deleted.'
        )
        _confirmation_dialogue.confirmed.connect(self.delete_queue)

    def delete_queue(self):
        self.close()

class QueueEditor(base_layouts.VerticalScrollArea):
    requestingExistingQueueList = QtCore.Signal()
    addNewQueue = QtCore.Signal()
    addQueueFromDisk = QtCore.Signal()
    deleteQueue = QtCore.Signal()
    changeQueueName = QtCore.Signal()
    changeQueueDirectory = QtCore.Signal()


    def __init__(self):
        super().__init__()




if __name__ == "__main__":
    from pyqt_interface_elements import base_windows
    import sys
    from animation_exporter.utility_resources import settings
    from PySide2 import QtWidgets


    _app = QtWidgets.QApplication(sys.argv)
    _view = QueueItem("name", "path")

    # _win = base_windows.Main_Window()
    # _win.setCentralWidget(_view)
    _view.show()

    sys.exit(_app.exec_())