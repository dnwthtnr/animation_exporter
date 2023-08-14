from pyqt_interface_elements import (base_layouts, base_widgets, proceadural_displays, icons, constants, base_windows)
from PySide2 import QtCore

# TODO: Dependency injection



class QueueItem(base_layouts.ExpandWhenClicked):
    CloseButtonClicked = QtCore.Signal(object)

    ExportNameChanged = QtCore.Signal(object, str)
    ExportFrameRangeChanged = QtCore.Signal(object, list)
    ExportDirectoryChanged = QtCore.Signal(object, str)

    def __init__(self, item_identifier, export_name, scene_path, frame_range, export_directory):
        super().__init__(margins=[5, 5, 0, 0], spacing=5)

        self.title_width = 150

        self.item_identifier = item_identifier
        self.export_name_widget = self.build_queue_name(export_name)
        self.scene_path_widget = self.build_queue_path(scene_path)

        self.frame_range_widget = self.build_frane_range(frame_range)

        self.export_directory_widget = self.build_export_directory(export_directory)
        self.status_icon = self.build_status_icon()
        _close_button = self.build_delete_button()

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
    def build_queue_name(self, name):
        _widget = proceadural_displays.LineEditAttributeEditor(attribute_name="Export File Name:", attribute_value=name)
        _widget.set_title_fixed_width(self.title_width)
        _widget.valueEdited.connect(self.emit_export_name_changed)
        return _widget

    def build_queue_path(self, path):

        _widget = proceadural_displays.LineEditAttributeEditor(attribute_name="Scene Path:", attribute_value=path)
        _widget.set_title_fixed_width(self.title_width)
        _widget.valueEdited.connect(self.emit_export_name_changed)
        _widget.setReadOnly(True)
        return _widget

    def build_status_icon(self):

        _widget = base_layouts.HorizontalLayout()
        return _widget


    def addStatusIcon(self, widget):
        self.status_icon.clear_layout()
        self.status_icon.addWidget(widget)


    def build_delete_button(self):
        _widget = base_widgets.Tool_Button()
        _widget.setIcon(icons.close)
        _widget.clicked.connect(partial(self.CloseButtonClicked.emit, self))
        return _widget

    def delete_button_clicked(self):
        base_windows.

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

class QueueEditor(base_layouts.VerticalScrollArea):
    requestingExistingQueueList = QtCore.Signal()
    addNewQueue = QtCore.Signal()
    addQueueFromDisk = QtCore.Signal()
    deleteQueue = QtCore.Signal()
    changeQueueName = QtCore.Signal()
    changeQueueDirectory = QtCore.Signal()


    def __init__(self):
        super().__init__()