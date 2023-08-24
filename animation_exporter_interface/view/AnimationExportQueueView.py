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
    proceadural_displays,
    visuals
)
from functools import partial
from animation_exporter.utility_resources import  keys



class SaveQueueWindow(base_layouts.VerticalLayout):
    saveQueue = QtCore.Signal(str)

    def __init__(self):
        super().__init__()
        _label = self._build_label()

        _save_directory = self._build_directory_selection()
        self._directory_selector = self._build_directory_selection()
        self._name_selector = self._build_name_selection(suggested_name="new_export_queue")
        self._save_button = self._build_save_button()
        _cancel_button = self._build_cancel_button()



        _buttons = base_layouts.HorizontalLayout()
        _buttons.addWidgets([self._save_button, _cancel_button])

        # _layout = base_layouts.VerticalLayout()

        self.addWidget(_label)
        self.addWidget(self._directory_selector)
        self.addWidget(self._name_selector)
        self.addWidget(_buttons)

        # self.setLayout(_layout)


    def _build_label(self):
        _label = base_widgets.Label(text="Save current export queue")
        return _label

    def _build_directory_selection(self):
        _widget = proceadural_displays.ChooseDirectoryAttributeEditor(attribute_name="Save Directory", attribute_value="")
        _widget.valueEdited.connect(self._directory_changed)
        return _widget

    def _build_name_selection(self, suggested_name):
        _widget = proceadural_displays.LineEditAttributeEditor(attribute_name="Queue Name", attribute_value=suggested_name)
        _widget.valueEdited.connect(self._directory_changed)
        return _widget


    def _build_save_button(self):
        _widget = base_widgets.Button(text="Save")
        _widget.clicked.connect(self._save_export_queue)
        return _widget

    def _build_cancel_button(self):
        _widget = base_widgets.Button(text="Cancel")
        _widget.clicked.connect(self.close)
        return _widget



    def _directory_changed(self, *args):
        _dir = self._directory_selector.attribute_value
        _name = self._directory_selector.attribute_value
        _save_dir = os.path.join(_dir, f"{_name}.json")

        if os.path.exists(_save_dir):
            self._save_button.setEnabled(False)
        else:
            self._save_button.setEnabled(True)


    def _save_export_queue(self):
        _dir = self._directory_selector.attribute_value
        _name = self._name_selector.attribute_value
        _save_dir = os.path.join(_dir, f"{_name}.json")

        self.saveQueue.emit(_save_dir)



class QueueItem(base_layouts.ExpandWhenClicked):
    CloseButtonClicked = QtCore.Signal(object)

    ExportNameChanged = QtCore.Signal(object, str)
    ExportFrameRangeChanged = QtCore.Signal(object, list)
    ExportDirectoryChanged = QtCore.Signal(object, str)

    def __init__(self, item_identifier, export_name, scene_path, frame_range, export_directory):
        super().__init__(margins=[5, 5, 0, 0], spacing=5)

        self.title_width = 150

        self.item_identifier = item_identifier
        self.export_name_widget = self.build_export_name(export_name)
        self.scene_path_widget = self.build_scene_path(scene_path)

        self.frame_range_widget = self.build_frane_range(frame_range)

        self.export_directory_widget = self.build_export_directory(export_directory)
        self.status_icon = self.build_status_icon()
        _close_button = self.build_close_button()

        self.addCollapsedWidget(self.export_name_widget)
        self.addCollapsedWidget(self.status_icon)
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


    #########################
    def build_export_name(self, name):
        _widget = proceadural_displays.LineEditAttributeEditor(attribute_name="Export File Name:", attribute_value=name)
        _widget.set_title_fixed_width(self.title_width)
        _widget.valueEdited.connect(self.emit_export_name_changed)
        return _widget

    def build_scene_path(self, path):

        _widget = proceadural_displays.LineEditAttributeEditor(attribute_name="Scene Path:", attribute_value=path)
        _widget.set_title_fixed_width(self.title_width)
        _widget.valueEdited.connect(self.emit_export_name_changed)
        _widget.setReadOnly(True)
        return _widget

    def build_frane_range(self, range):
        if range is None:
            _widget = proceadural_displays.TwoDimentionalLineEditAttributeEditor(attribute_name="Export Range:", attribute_value=[0, 0])
            _widget.hide()
            return _widget

        _widget = proceadural_displays.TwoDimentionalLineEditAttributeEditor(attribute_name="Export Range:", attribute_value=range)
        _widget.set_title_fixed_width(self.title_width)
        _widget.valueEdited.connect(self.emit_frame_range_changed)
        return _widget

    def build_export_directory(self, directory):

        _widget = proceadural_displays.ChooseDirectoryAttributeEditor(attribute_name="Export Directory:", attribute_value=directory)
        _widget.set_title_fixed_width(self.title_width)
        _widget.valueEdited.connect(self.emit_export_name_changed)
        return _widget

    def build_status_icon(self):
        _widget = base_layouts.HorizontalLayout()
        return _widget


    def addStatusIcon(self, widget):
        self.status_icon.clear_layout()
        self.status_icon.addWidget(widget)


    def build_close_button(self):
        _widget = base_widgets.Tool_Button()
        _widget.setIcon(icons.close)
        _widget.clicked.connect(partial(self.CloseButtonClicked.emit, self))
        return _widget

    #######

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

    saveCurrentQueue = QtCore.Signal(str)

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
        """
        Builds button to start export queue

        Returns
        -------
        base_widgets.Button
            The new button

        """
        _button = base_widgets.Button(text='Start Queue')
        _button.setMinimumSize(105, 25)
        _button.clicked.connect(self.StartQueueButtonClicked.emit)
        _button.setStyleSheet(styles.maya_button)
        return _button


    @QtCore.Slot()
    def queueItemCompleted(self, item_id):
        for _item in self.queue_items:
            if _item.item_identifier == item_id:
                _item.status_icon.clear_layout()
                # _item.addStatusIcon(icons.checkbox_checked)
        return


    @QtCore.Slot()
    def queueItemStarted(self, item_id):
        for _item in self.queue_items:
            if _item.item_identifier == item_id:
                _item.addStatusIcon(visuals.loading_wheel())
                # _item.addStatusIcon(icons.checkbox_checked)

    #######################################################

    def build_queue_selection_combobox(self):
        """
        Builds the combobox to hold different export queue selections

        Returns
        -------
        base_layouts.HorizontalLayout
            The new selection combobox

        """
        _label = base_widgets.Label(text="Current Export Queue:")

        self.queues_combo = base_widgets.ComboBox()
        self.queues_combo.currentTextChanged.connect(self.QueueSelected.emit)

        self.save_queue_button = base_widgets.Tool_Button()
        self.save_queue_button.setIcon(icons.save)
        self.save_queue_button.clicked.connect(self.save_current_export_queue)

        _layout = base_layouts.HorizontalLayout(spacing=5)
        _layout.addWidget(_label)
        _layout.addWidget(self.queues_combo, stretch=1)
        _layout.addWidget(self.save_queue_button)
        return _layout

    @QtCore.Slot()
    def save_current_export_queue(self):
        self.save_export_queue_window = SaveQueueWindow()
        self.save_export_queue_window.show()
        self.save_export_queue_window.saveQueue.connect(self.saveCurrentQueue.emit)
        return

    @QtCore.Slot()
    def populate_queues_combobox(self, queues):
        """
        Populates the queue selection combobox with the given dictionary of queue items

        Parameters
        ----------
        queues : dict of dict
            The queues

        """
        _current = self.queues_combo.currentText()
        self.queues_combo.clear()
        self.queues_combo.addItems(queues)
        if _current in queues:
            self.queues_combo.setCurrentText(_current)
            return
        self.queues_combo.setCurrentIndex(0)

    @QtCore.Slot()
    def add_queue(self, queue):
        self.queues_combo.addItem(queue)


    def remove_queue(self, queue):
        _index = self.queues_combo.findText(queue)
        if _index == -1:
            return

        self.queues_combo.removeItem(_index)

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
