from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import base_widgets, base_layouts, base_windows, line_edits, model_view_delegate, constants


class ExporterSceneView(base_layouts.Vertical_Layout):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.item_view = None
        self.item_model = None

        self.finish_initialization()

    def finish_initialization(self):
        self.content_panel = base_layouts.Vertical_Layout()
        self.addWidget(self.content_panel)
        self.populate_with_empty_view()

    def populate_item_view(self, content_dictionary):
        self.content_panel.clear_layout()

        self.item_model = model_view_delegate.Selection_List_Model(items=content_dictionary)

        self.item_view = self.build_item_view()
        self.item_view.setModel(self.item_model)


        self.content_panel.addWidget(self.item_view)


    def populate_with_empty_view(self):
        self.content_panel.clear_layout()
        _layout = base_layouts.Vertical_Layout()

        _label = base_widgets.Label(f'Nothing to Display. Please Select File')

        _layout.addWidget(_label)
        self.content_panel.addWidget(_layout, alignment=constants.align_center)

    def empty_view(self):
        self.populate_with_empty_view()
        self.item_view = None
        self.item_model = None

    def build_item_view(self):
        _view = model_view_delegate.Table_Item_Selection_View()
        return _view
