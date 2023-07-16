from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import base_widgets, base_layouts, base_windows, line_edits, model_view_delegate, constants, styles


class ExporterSceneView(base_layouts.VerticalLayout):
    SceneSelected = QtCore.Signal(object)
    ItemSelected = QtCore.Signal(object)

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
        _file_picker = self.build_file_picker()

        _layout = base_layouts.HorizontalLayout()
        _layout.addWidgets([_label, _file_picker])

        return _layout

    def build_file_label(self):
        _label = base_widgets.Label(text="Current Scene: ")
        return _label

    def build_file_picker(self):
        _file_picker = line_edits.File_Selection_Line_Edit("")
        _file_picker.FileSelected.connect(self.SceneSelected.emit)
        return _file_picker


    def populate_with_empty_view(self):
        self.content_panel.clear_layout()
        _layout = base_layouts.VerticalLayout()

        _label = base_widgets.Label(f'Nothing to Display. Please Select File')

        _layout.addWidget(_label)
        self.content_panel.addWidget(_layout, alignment=constants.align_center)

    @QtCore.Slot()
    def populate_item_view(self, content_dictionary):
        self.content_panel.clear_layout()

        self.item_model = model_view_delegate.Selection_Tree_Model(content_dictionary)

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
        _view.SelectionChanged.connect(self.emit_item_selection_changed)
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
    def emit_item_selection_changed(self, item):
        _node = self.item_model.get_node_for_display_name(item)
        self.ItemSelected.emit(_node.data_dcitonary)


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
