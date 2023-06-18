
import logging
import os.path

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import base_widgets, base_layouts, base_windows, constants, line_edits, model_view_delegate, icons
from functools import partial


class QueueItem(base_layouts.Horizontal_Layout):
    CloseButtonClicked = QtCore.Signal(object)

    def __int__(self, export_name, scene_path, frame_range, export_directory):
        super().__init__()
        self.export_name_widget = self.build_export_name()
        self.scene_path_widget = self.build_scene_path()
        self.frame_range_widget = self.build_frane_range()
        self.export_directory_widget = self.build_export_directory()
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
        _str_list =  self.frame_range_widget.text().split(" -- ")
        return [float(_num) for _num in _str_list]

    @property
    def export_directory(self):
        return self.export_directory_widget.directory

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

    def build_close_button(self):
        _widget = base_widgets.Tool_Button()
        _widget.setIcon(icons.close)
        _widget.clicked.connect(partial(self.CloseButtonClicked.emit, self))
        return _widget

class QueueItemHolder(base_layouts.Vertical_Layout):
    QueueItemRemoved = QtCore.Signal()

    def __int__(self):
        super().__init__()
        self.queue_items = []

        self.populate_with_empty_view()


    def populate_with_empty_view(self):
        self.clear_layout()
        _layout = base_layouts.Vertical_Layout()

        _label = base_widgets.Label(f'Queue is Currently Empty')

        _layout.addWidget(_label)
        self.addWidget(_layout, alignment=constants.align_center)

    @QtCore.Slot()
    def add_queue_item(self, export_name, scene_path, frame_range, export_directory):
        """
        Adds a queue item with the given attributes
        Parameters
        ----------
        export_name
        scene_path
        frame_range
        export_directory

        Returns
        -------

        """
        if len(self.queue_items) == 0:
            self.clear_layout()

        _item = QueueItem(export_name, scene_path, frame_range, export_directory)
        _item.CloseButtonClicked.connect(self.remove_queue_item)

        self.addWidget(_item)

        self.queue_items.append(_item)

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
        self.disown_child(queue_item)

        _queue_index = self.queue_items.index(queue_item)
        self.queue_items.pop(_queue_index)

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

class ExporterQueueDisplay(base_layouts.Vertical_Layout):
    ExportQueueDataQuery = QtCore.Signal()

    def __init__(self):
        super().__init__()


    def finish_initialization(self):
        _button_holder = self.build_button_holder()


        self.content_panel = base_layouts.Vertical_Layout()
        self.populate_with_empty_view()

        self.addWidget(self.content_panel, stretch=1)
        self.addWidget(_button_holder, alignment=constants.align_bottom)

        self.ExportQueueDataQuery.emit()


    #####################view#######################

    @QtCore.Slot()
    def populate_queue_view(self, content_dictionary):
        self.content_panel.clear_layout()

        self.item_model = model_view_delegate.Selection_Tree_Model(content_dictionary)

        self.item_view = self.build_item_view()
        self.item_view.setModel(self.item_model)

        self.content_panel.addWidget(self.item_view)


    # TODO: Seperate method to add singular export items instead of

    def build_item_view(self):
        _view = model_view_delegate.Selection_Table_Model()
        _view.horizontalHeader().setStretchLastSection(True)
        _view.setSelectionBehavior(model_view_delegate.Table_Item_Selection_View.SelectRows)
        _view.SelectionChanged.connect(self.emit_item_selection_changed)
        return _view

    #############buttons################

    def build_button_holder(self):
        self.export_button = self.build_export_button()
        self.close_button = self.build_close_button()

        _layout = base_layouts.Horizontal_Layout()
        _layout.addWidgets([self.export_button, self.close_button])
        return _layout

    def build_export_button(self):
        _button = base_widgets.Button(text="Remove")
        # _button.clicked.connect(self.emit_export_signal)
        return _button

    def build_close_button(self):
        _button = base_widgets.Button(text="Close")
        # _button.clicked.connect(self.CloseButtonClicked.emit)
        return _button


if __name__ == "__main__":
    import sys

    _app = QtWidgets.QApplication(sys.argv)

    try:
        _window = ExporterQueueDisplay()
        _window.finish_initialization()
        _window.show()
    except Exception as e:
        print(e)

    sys.exit(_app.exec_())
