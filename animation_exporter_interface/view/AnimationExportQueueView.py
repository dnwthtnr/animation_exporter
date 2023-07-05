import logging
import os.path

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import (
    base_widgets,
    base_layouts,
    base_windows,
    constants,
    line_edits,
    model_view_delegate,
    icons,
    styles,
    proceadural_displays
)
from functools import partial
from animation_exporter.utility_resources import  keys


class QueueItem(base_layouts.ExpandWhenClicked):
    CloseButtonClicked = QtCore.Signal(object)

    ExportNameChanged = QtCore.Signal(object, str)
    ExportFrameRangeChanged = QtCore.Signal(object, list)
    ExportDirectoryChanged = QtCore.Signal(object, str)

    def __init__(self, item_identifier, export_name, scene_path, frame_range, export_directory):
        super().__init__(margins=[5, 5, 0, 0], spacing=5)
        self.item_identifier = item_identifier
        self.export_name_widget = self.build_export_name(export_name)
        self.scene_path_widget = self.build_scene_path(scene_path)
        self.frame_range_widget = self.build_frane_range(frame_range)
        self.export_directory_widget = self.build_export_directory(export_directory)
        _close_button = self.build_close_button()

        self.addCollapsedWidget(self.export_name_widget)
        self.addCollapsedWidget(_close_button, alignment=constants.align_right)

        self.addExpandedWidget(self.scene_path_widget)
        self.addExpandedWidget(self.frame_range_widget)
        self.addExpandedWidget(self.export_directory_widget)

        self.set_expanded_stylesheet(styles.maya_expanded_collapsible_layout)
        self.set_collapsed_stylesheet(styles.maya_collapsed_layout)

    @property
    def export_name(self):
        return self.export_name_widget.attribute_value

    @property
    def scene_path(self):
        return self.scene_path_widget.attribute_value

    @property
    def frame_range(self):
        return self.frame_range_widget.attribute_value

    @property
    def export_directory(self):
        return self.export_directory_widget.attribute_value

    def build_export_name(self, name):
        _widget = proceadural_displays.LineEditAttributeEditor(attribute_name="Export File Name:", attribute_value=name)
        _widget.valueEdited.connect(self.emit_export_name_changed)
        return _widget

    def build_scene_path(self, path):

        _widget = proceadural_displays.LineEditAttributeEditor(attribute_name="Scene Path:", attribute_value=path)
        _widget.valueEdited.connect(self.emit_export_name_changed)
        _widget.setReadOnly(True)
        return _widget

    def build_frane_range(self, range):
        _widget = proceadural_displays.TwoDimentionalLineEditAttributeEditor(attribute_name="Export Range:", attribute_value=range)
        _widget.valueEdited.connect(self.emit_frame_range_changed)
        return _widget

    def build_export_directory(self, directory):

        _widget = proceadural_displays.ChooseDirectoryAttributeEditor(attribute_name="Export Directory:", attribute_value=directory)
        _widget.valueEdited.connect(self.emit_export_name_changed)
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


class QueueItemHolder(base_layouts.VerticalLayout):
    RemoveQueueItem = QtCore.Signal(object)

    UpdateQueueItemName = QtCore.Signal(object, str)
    UpdateQueueItemExportDirectory = QtCore.Signal(object, str)
    UpdateQueueItemFrameRange = QtCore.Signal(object, list)

    StartQueueButtonClicked = QtCore.Signal()

    QueueSelectionListDataQuery = QtCore.Signal()
    QueueSelected = QtCore.Signal(str)

    queue_items = []

    def finish_initialization(self):
        self.queue_item_layout = base_layouts.VerticalScrollArea()
        self.populate_with_empty_view()

        self.export_button = self.build_start_button()

        _queue_selection_widget = self.build_queue_selection_combobox()

        self.addWidget(_queue_selection_widget, alignment=constants.align_top)
        self.addWidget(self.queue_item_layout, stretch=1)
        self.addWidget(self.export_button, alignment=constants.align_right)

        self.QueueSelectionListDataQuery.emit()
        self.setStyleSheet(styles.queue_view)

    def build_start_button(self):
        _button = base_widgets.Button(text='Start Queue')
        _button.setMinimumSize(105, 25)
        _button.clicked.connect(self.StartQueueButtonClicked.emit)
        _button.setStyleSheet(styles.maya_button)
        return _button

    #######################################################

    def build_queue_selection_combobox(self):
        _label = base_widgets.Label(text="Current Export Queue:")

        self.queues_combo = base_widgets.ComboBox()
        self.queues_combo.currentTextChanged.connect(self.QueueSelected.emit)

        self.save_queue_button = base_widgets.Tool_Button()
        self.save_queue_button.setIcon(icons.save)

        _layout = base_layouts.HorizontalLayout(spacing=5)
        _layout.addWidget(_label)
        _layout.addWidget(self.queues_combo, stretch=1)
        return _layout

    @QtCore.Slot()
    def populate_queues_combobox(self, queues):
        self.queues_combo.clear()
        self.queues_combo.addItems(queues)
        self.queues_combo.setCurrentIndex(0)

    @QtCore.Slot()
    def add_queue(self, queue):
        self.queues_combo.addItem(queue)

    ###########################

    @QtCore.Slot()
    def populate_queue_view(self, queue):
        """
        Clears the queue item holder and populates from the given queue
        Parameters
        ----------
        queue

        Returns
        -------

        """
        self.clear_queue()

        if len(queue) == 0:
            self.populate_with_empty_view()

        logger.info(f'Populating queue view from given queue.')
        logger.debug(f'Given queue: {queue}')
        for _queue_item_dict in queue.values():
            self.add_queue_item(
                queue_item_identifier=_queue_item_dict.get(keys.queue_item_identifier_key),
                export_name=_queue_item_dict.get(keys.item_export_name_key),
                scene_path=_queue_item_dict.get(keys.scene_path_key),
                frame_range=_queue_item_dict.get(keys.animation_range_key),
                export_directory=_queue_item_dict.get(keys.export_directory_key)
            )

    def __int__(self):
        super().__init__()

    def populate_with_empty_view(self):
        self.queue_item_layout.clear_layout()
        _layout = base_layouts.VerticalLayout()

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
