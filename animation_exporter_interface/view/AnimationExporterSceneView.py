from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import base_widgets, base_layouts, base_windows, line_edits, model_view_delegate, constants, styles
from animation_exporter.animation_exporter_interface.controller import scene_controller


class ExporterSceneView(base_layouts.VerticalLayout):
    SceneSelected = QtCore.Signal(object)

    newItemData = QtCore.Signal(dict)
    combineItemDataSets = QtCore.Signal(list)

    sceneItemSelectionChanged = QtCore.Signal(list)

    _setScenePath = QtCore.Signal(object)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.item_view = None
        self.item_model = None

    def finish_initialization(self):
        _current_scene_widget = self.build_current_scene_widget()
        self.content_panel = base_layouts.VerticalLayout()

        _central = base_layouts.VerticalLayout()
        _central.addWidget(_current_scene_widget, alignment=constants.align_top)
        _central.addWidget(self.content_panel, stretch=1)

        self.addWidget(_central)
        self.populate_with_empty_view()
        _central.setStyleSheet(styles.maya_outliner)
        self.setStyleSheet(styles.maya_outliner)

    def build_current_scene_widget(self):

        _label = self.build_file_label()
        self._file_picker = self.build_file_picker()

        _layout = base_layouts.HorizontalLayout()
        _layout.addWidgets([_label, self._file_picker])

        return _layout

    def build_file_label(self):
        _label = base_widgets.Label(text="Current Scene: ")
        return _label

    def build_file_picker(self):
        _file_picker = line_edits.File_Selection_Line_Edit("")
        self._setScenePath.connect(_file_picker.set_display_path)
        _file_picker.FileSelected.connect(self.SceneSelected.emit)
        return _file_picker

    def setFileLoadingState(self, loading, *args):
        self._file_picker.setFileLoadingState(loading)

        if loading is True:
            self.populate_with_empty_view()

    def populate_with_empty_view(self, *args):
        self.content_panel.clear_layout()
        _layout = base_layouts.VerticalLayout()

        _label = base_widgets.Label(f'Nothing to Display. Please Select File')

        _layout.addWidget(_label)
        self.content_panel.addWidget(_layout, alignment=constants.align_center)


    def setItemModel(self, model):
        self.content_panel.clear_layout()

        self.item_view = self.build_item_view()
        self.item_view.setModel(model)

        self.content_panel.addWidget(self.item_view)


    def setScenePath(self, filepath):
        self._setScenePath.emit(filepath)

    @QtCore.Slot()
    def populate_item_view(self, scene_path, scene_data):
        # print(scene_path)
        self.content_panel.clear_layout()

        self.set_scene_path(scene_path)

        self.item_model = model_view_delegate.Selection_Tree_Model(scene_data)

        self.item_view = self.build_item_view()
        self.item_view.setModel(self.item_model)

        self.content_panel.addWidget(self.item_view)

    def empty_view(self):
        self.populate_with_empty_view()
        self.item_view = None
        self.item_model = None

    def build_item_view(self):
        _view = model_view_delegate.Tree_Item_Selection_View()
        # _view.horizontalHeader().setStretchLastSection(True)
        # _view.setSelectionBehavior(model_view_delegate.Table_Item_Selection_View.SelectRows)
        _view.SelectionChanged.connect(self.sceneItemSelectionChanged.emit)
        return _view

    def current_selection(self):
        """
        The currently selected item

        Returns
        -------
        str
            The item name

        """
        return self.item_view.current_selection()


    #signals

    @QtCore.Slot()
    def items_selected(self, items):
        """
        Get the data from the item model for the given items

        Parameters
        ----------
        items : list[str]
            Item identifiers corresponding to items in the current item model

        """
        _sceneDataList = []
        for _item in items:
            _node_for_item = self.item_model.get_node_for_display_name(_item)
            _data_for_node = _node_for_item.data_dictionary
            _sceneDataList.append(_data_for_node)

        if len(_sceneDataList) == 1:
            self.emit_item_selection_changed(_sceneDataList[0])
            return

        self.combineItemDataSets.emit(_sceneDataList)


    @QtCore.Slot()
    def emit_item_selection_changed(self, items):
        """

        Parameters
        ----------
        items : list[str]
            List of selected items to get data for

        """
        _sceneDataList = []
        for _item in items:
            _node_for_item = self.item_model.get_node_for_display_name(_item)
            _data_for_node = _node_for_item.data_dictionary
            _sceneDataList.append(_data_for_node)

        _data = scene_controller.combineSceneData(sceneDataList=_sceneDataList)
        # _node = self.item_model.get_node_for_display_name(items)
        # TODO: Add ability to combien data here for multiple selections. Accept lIst
        # print('\n\n',items, _node.data_dictionary, '\n\n')
        self.newItemData.emit(_data)


if __name__ == "__main__":
    import sys

    _app = QtWidgets.QApplication(sys.argv)

    try:
        _window = ExporterSceneView()
        _window.finish_initialization()
        _window.show()
    except Exception as e:
        print(e)

    sys.exit(_app.exec_())
