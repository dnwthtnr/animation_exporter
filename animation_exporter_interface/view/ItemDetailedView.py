import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)

from pyqt_interface_elements import base_widgets, base_layouts, base_windows, constants


class ItemDetailedView(base_layouts.Vertical_Layout):

    def __init__(self, item_data_dictionary, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.item_data = item_data_dictionary


    def addSection(self, name, data):
        if not isinstance(data, str):
            data = f"{data}"
        _label = base_widgets.Label(text=name)
        _data_layout = base_layouts.Vertical_Layout()

        _data = base_widgets.Line_Edit()
        _data.setText(str(data))

        _data_layout.addWidgets([_label, _data])

        self.addWidget(_data_layout)
        return

    def addButton(self, text):
        _button = base_widgets.Button(text=text)
        self.addWidget(_button)
        return _button

