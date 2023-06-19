from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import base_widgets, base_layouts, base_windows, line_edits, model_view_delegate, constants


class ExporterSceneView(base_layouts.Vertical_Layout):
    ItemSelected = QtCore.Signal(object)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.item_view = None
        self.item_model = None

    def finish_initialization(self):
        self.content_panel = base_layouts.Vertical_Layout()
        self.addWidget(self.content_panel)
        self.populate_with_empty_view()


    def populate_with_empty_view(self):
        self.content_panel.clear_layout()
        _layout = base_layouts.Vertical_Layout()

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
        self.ItemSelected.emit(item)


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
