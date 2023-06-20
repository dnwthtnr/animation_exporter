import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)

from pyqt_interface_elements import base_widgets, base_layouts, base_windows, constants, proceadural_displays

class ItemDetailAttributeHolder(proceadural_displays.AbstractEntryHolder):

    def __int__(self, *args, **kwargs):
        print('stuff',*args, **kwargs)
        print(super())
        super().__int__(
            *args,
            **kwargs
        )


    def create_attribute_entry(self, attribute_name, attribute_value, attribute_mapping_dictionary, map_by_type):
        _entry = None
        if isinstance(attribute_value, list) and len(attribute_value) == 2:
            _entry = attribute_mapping_dictionary["TwoDim"]

        elif isinstance(attribute_value, str):
            _entry = attribute_mapping_dictionary[str]

        if _entry is None:
            return None

        return _entry(attribute_name, attribute_value)


class ItemDetailedView(base_layouts.Vertical_Layout):

    def __init__(self, item_data_dictionary, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.item_data = item_data_dictionary


    def finish_initialization(self):
        self.attribute_holder = self.build_attribute_holder()
        _button = self.build_add_to_queue_button()

        self.addWidget(self.attribute_holder)
        self.addWidget(_button)
        return

    def build_attribute_holder(self):
        _attr_map_dict = {
            "TwoDim": proceadural_displays.TwoDimentionalLineEditAttributeEditor,
            str: proceadural_displays.LineEditAttributeEditor
        }
        _holder = ItemDetailAttributeHolder()
        return _holder

    def build_add_to_queue_button(self):
        _button = base_widgets.Button(text="Add to Queue")
        _button.clicked.connect(self.emit_add_to_queue)
        return _button

    def emit_add_to_queue(self):
        return


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

