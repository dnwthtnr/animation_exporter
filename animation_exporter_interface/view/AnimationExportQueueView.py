
import logging
import os.path

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import base_widgets, base_layouts, base_windows, constants, line_edits, model_view_delegate, icons
from functools import partial


class QueueItem(base_layouts.Horizontal_Layout):
    CloseButtonClicked = QtCore.Signal(object)

    ExportNameChanged = QtCore.Signal(object, str)
    ExportFrameRangeChanged = QtCore.Signal(object, list)
    ExportDirectoryChanged = QtCore.Signal(object, str)

    def __init__(self, item_identifier, export_name, scene_path, frame_range, export_directory):
        super().__init__(spacing = 7)
        self.item_identifier = item_identifier
        self.export_name_widget = self.build_export_name(export_name)
        self.scene_path_widget = self.build_scene_path(scene_path)
        self.frame_range_widget = self.build_frane_range(frame_range)
        self.export_directory_widget = self.build_export_directory(export_directory)
        _close_button = self.build_close_button()

        self.addWidget(self.export_name_widget)
        self.addWidget(self.scene_path_widget)
        self.addWidget(self.frame_range_widget)
        self.addWidget(self.export_directory_widget)
        self.addWidget(_close_button)


    @property
    def export_name(self):
        return self.export_name_widget.text()

    @property
    def scene_path(self):
        return self.scene_path_widget.text()

    @property
    def frame_range(self):
        return self.frame_range_widget.value()

    @property
    def export_directory(self):
        return self.export_directory_widget.directory

    def build_export_name(self, name):
        _widget = base_widgets.Line_Edit(text=name)
        _widget.textEdited.connect(self.emit_export_name_changed)
        return _widget

    def build_scene_path(self, path):
        _widget = base_widgets.Line_Edit(text=path)
        _widget.setReadOnly(True)
        return _widget

    def build_frane_range(self, range):
        _widget = line_edits.TwoDimensionalFloat(x_val=range[0], y_val=range[1])
        _widget.valueChanged.connect(self.emit_frame_range_changed)
        return _widget

    def build_export_directory(self, directory):
        _widget = line_edits.Folder_Selection_Line_Edit(directory)
        _widget.textEdited.connect(self.emit_export_name_changed)
        return _widget

    def build_close_button(self):
        _widget = base_widgets.Tool_Button()
        _widget.setIcon(icons.close)
        _widget.clicked.connect(partial(self.CloseButtonClicked.emit, self))
        return _widget

    @QtCore.Slot()
    def emit_export_name_changed(self, *args):
        self.ExportNameChanged.emit(self.item_identifier, self.export_name)

    @QtCore.Slot()
    def emit_export_directory_changed(self, *args):
        self.ExportDirectoryChanged.emit(self.item_identifier, self.export_directory)

    @QtCore.Slot()
    def emit_frame_range_changed(self, *args):
        self.ExportFrameRangeChanged.emit(self.item_identifier, self.frame_range)


class QueueItemHolder(base_layouts.Vertical_Layout):
    RemoveQueueItem = QtCore.Signal(object)

    UpdateQueueItemName = QtCore.Signal(object, str)
    UpdateQueueItemExportDirectory = QtCore.Signal(object, str)
    UpdateQueueItemFrameRange = QtCore.Signal(object, list)

    StartQueueButtonClicked = QtCore.Signal()
    queue_items = []

    def finish_initialization(self):
        self.queue_item_layout = base_layouts.Vertical_Layout()
        self.populate_with_empty_view()

        self.export_button = base_widgets.Button(text='Start Queue')
        self.export_button.clicked.connect(self.StartQueueButtonClicked.emit)

        self.addWidget(self.queue_item_layout)
        self.addWidget(self.export_button)

    def __int__(self):
        super().__init__()

    def populate_with_empty_view(self):
        self.queue_item_layout.clear_layout()
        _layout = base_layouts.Vertical_Layout()

        _label = base_widgets.Label(f'Queue is Currently Empty')

        _layout.addWidget(_label)
        self.queue_item_layout.addWidget(_layout, alignment=constants.align_center)


    @QtCore.Slot()
    def add_queue_item(self, queue_item_identifier, export_name, scene_path, frame_range, export_directory):
        """
        Adds a queue item with the given attributes
        Parameters
        ----------
        queue_item_identifier
        export_name
        scene_path
        frame_range
        export_directory

        Returns
        -------

        """
        if len(self.queue_items) == 0:
            self.queue_item_layout.clear_layout()
            self.queue_item_layout.addStretch(1)

        _item = QueueItem(
            item_identifier=queue_item_identifier,
            export_name=export_name,
            scene_path=scene_path,
            frame_range=frame_range,
            export_directory=export_directory
        )

        _item.CloseButtonClicked.connect(self.remove_queue_item)
        _item.ExportDirectoryChanged.connect(self.emit_update_queue_item_export_directory)
        _item.ExportNameChanged.connect(self.emit_update_queue_item_name)
        _item.ExportFrameRangeChanged.connect(self.emit_update_queue_item_frame_range)

        self.queue_item_layout.insertWidget(0, _item)

        self.queue_items.append(_item)

    #########################################################

    @QtCore.Slot()
    def remove_queue_item(self, queue_item):
        """
        Removes the given queue item
        Parameters
        ----------
        queue_item

        Returns
        -------

        """
        self.RemoveQueueItem.emit(queue_item.item_identifier)

        self.disown_child(queue_item)

        _queue_index = self.queue_items.index(queue_item)
        self.queue_items.pop(_queue_index)


    @QtCore.Slot()
    def emit_update_queue_item_name(self, queue_item_identifier, new_name):
        self.UpdateQueueItemName.emit(queue_item_identifier, new_name)

    @QtCore.Slot()
    def emit_update_queue_item_export_directory(self, queue_item_identifier, new_directory):
        self.UpdateQueueItemExportDirectory.emit(queue_item_identifier, new_directory)


    @QtCore.Slot()
    def emit_update_queue_item_frame_range(self, queue_item_identifier, new_range):
        self.UpdateQueueItemFrameRange(queue_item_identifier, new_range)


    #############################################

    def clear_queue(self):
        """
        Removes all queue items
        Returns
        -------

        """
        for _queue_item in self.queue_items:
            self.remove_queue_item(_queue_item)
        return

    def build_export_name(self, name):
        _widget = base_widgets.Line_Edit(text=name)
        return _widget

    def build_scene_path(self, path):
        _widget = base_widgets.Line_Edit(text=path)
        _widget.setReadOnly(True)
        return _widget

    def build_frane_range(self, range):
        _widget = base_widgets.Line_Edit(text=" -- ".join(range))
        _widget.setReadOnly(True)
        return _widget

    def build_export_directory(self, directory):
        _widget = line_edits.Folder_Selection_Line_Edit(directory)
        return _widget


if __name__ == "__main__":
    import sys

    _app = QtWidgets.QApplication(sys.argv)

    try:
        _window = QueueItemHolder()
        _window.finish_initialization()
        _window.show()
    except Exception as e:
        print(e)

    sys.exit(_app.exec_())
