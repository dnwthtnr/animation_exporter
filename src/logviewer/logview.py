from PySide2 import QtWidgets, QtCore
import logging
import logcontroller

from PySideWrapper import base_windows, model_view_delegate, base_widgets, base_layouts, icons

logger = logging.getLogger(__name__)


class LogFileTreeModel(model_view_delegate.BaseDictTreeModel):

    def __int__(self, log_hierarchy_dict, keys_to_exclude):
        super().__int__(
            item_dict=log_hierarchy_dict,
            node_type=model_view_delegate.FileNode,
            keys_to_exclude=keys_to_exclude
        )

    def create_node(self, key, value, node_type):
        info_dict = value.get(logcontroller.LogFileBroker.Keys.ItemInfo)
        _display_name = info_dict.get(logcontroller.LogFileBroker.Keys.ItemDisplayName)
        _type = info_dict.get(logcontroller.LogFileBroker.Keys.ItemType)
        _node = node_type(
            filepath=key,
            display_name=_display_name,
            display_icon=icons.open_file
        )
        return _node

    def header_for_column(self, column):
        if column == 0:
            return self.root_node.display_name
        return


class LogViewer(base_windows.Main_Window):
    fileSelectionChanged = QtCore.Signal(str)

    def __init__(self, logger=None, *args, **kwargs):
        self._hierarchy_view = None
        self._log_viewer = None
        super().__init__(logger=logger, *args, **kwargs)

        self.setWindowTitle("Log Viewer")
        self._build_log_viewer()

    @property
    def hierarchy_view(self):
        """

        Returns
        -------
        QtWidgets.QTreeView


        """
        return self._hierarchy_view

    @property
    def log_viewer(self):
        return self._log_viewer


    def _build_log_viewer(self):
        self._hierarchy_view = self._build_hierarchy_view()
        self._log_viewer = self._build_log_view()

        central_widget = base_layouts.HorizontalLayout()
        central_widget.addWidget(self.hierarchy_view)
        central_widget.addWidget(self.log_viewer)
        self.setCentralWidget(central_widget)


    def _build_hierarchy_view(self):
        _view = model_view_delegate.Tree_Item_Selection_View()
        _view.SelectionChanged.connect(self.file_selection_changed)
        return _view

    def file_selection_changed(self, new_selection):
        print(new_selection)
        self.fileSelectionChanged.emit(new_selection[0])

    def update_log_view(self, log_data):
        self.log_viewer.setText(log_data)


    def update_hierarchy_view(self, hierarchy_dict):
        _model = LogFileTreeModel(
            hierarchy_dict,
            keys_to_exclude=[logcontroller.LogFileBroker.Keys.ItemInfo])

        self.hierarchy_view.setModel(_model)
        # self.log_viewer.clear()


    def _build_log_view(self):
        _view = base_widgets.TextEdit(text="Viewer")
        return _view



