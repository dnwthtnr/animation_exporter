from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import base_widgets, base_layouts, base_windows, line_edits, model_view_delegate, constants


class ExporterSceneView(base_layouts.Vertical_Layout):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.item_view = None
        self.item_model = None

        self.finish_initialization()

    def finish_initialization(self):
        _empty_view = self.build_empty_view()
        self.content_panel = base_layouts.Vertical_Layout()
        self.content_panel.addWidget(_empty_view, alignment=constants.align_center)
        self.addWidget(self.content_panel)
        _empty_view = self.populate_item_view({"item": {"Object Type": "type"}})


    def build_empty_view(self):
        _layout = base_layouts.Vertical_Layout()

        _label = base_widgets.Label(f'Nothing to Display. Please Select File')

        _layout.addWidget(_label)
        return _layout

    def build_item_view(self):
        _view = model_view_delegate.Table_Item_Selection_View()
        return _view

    def populate_item_view(self, content_dictionary):

        self.item_model = model_view_delegate.Selection_List_Model(items=content_dictionary)

        self.item_view = self.build_item_view()
        self.item_view.setModel(self.item_model)


        self.clear_layout()
        self.content_panel.addWidget(self.item_view)
