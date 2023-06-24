import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)

from PySide2 import QtCore

from pyqt_interface_elements import base_widgets, base_layouts, base_windows, constants, proceadural_displays, styles

_attr_map_dict = {
    "TwoDim": proceadural_displays.TwoDimentionalLineEditAttributeEditor,
    str: proceadural_displays.LineEditAttributeEditor
}

_attrs = [
    proceadural_displays.TwoDimentionalLineEditAttributeEditor,
    proceadural_displays.LineEditAttributeEditor,
    proceadural_displays.FilepathDisplayAttributeEditor,
    proceadural_displays.ChooseDirectoryAttributeEditor,
    proceadural_displays.LargeListAttributeEditor
]


class ItemDetailAttributeHolder(proceadural_displays.AbstractEntryHolder):
    def __init__(self, attribute_dictionary):
        super().__init__(attribute_dictionary=attribute_dictionary, attribute_mapping_dictionary=_attrs, map_by_type=False)

    # def create_attribute_entry(self, attribute_name, attribute_value, attribute_mapping_dictionary, map_by_type):
    #     print('building entry')
    #     _entry = None
    #     if isinstance(attribute_value, list) and len(attribute_value) == 2:
    #         _entry = attribute_mapping_dictionary["TwoDim"]
    #
    #     elif isinstance(attribute_value, str):
    #         _entry = attribute_mapping_dictionary[str]
    #
    #     if _entry is None:
    #         return None
    #
    #     return _entry(attribute_name=attribute_name, attribute_value=attribute_value)

    def create_attribute_entry(self, attribute_name, attribute_value, attribute_mapping_dictionary, map_by_type):
        for _entry_type in attribute_mapping_dictionary:
            if _entry_type.identifier(self, value=attribute_value) is True:
                _entry = _entry_type(attribute_name, attribute_value)
                return _entry
        return None


class ItemDetailedView(base_layouts.Vertical_Layout):
    AddToQueueButtonClicked = QtCore.Signal(dict)
    ExportButtonClicked = QtCore.Signal(dict)

    def __init__(self, item_data_dictionary, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.item_data = item_data_dictionary

    def finish_initialization(self):
        self.attribute_holder = self.build_attribute_holder()
        _button = self.build_add_to_queue_button()

        self.addWidget(self.attribute_holder)
        self.addWidget(_button)
        self.setStyleSheet(styles.maya_detail_view)
        return

    def build_attribute_holder(self):
        logger.info(f'Building item data attribute holder with given item data')
        logger.debug(self.item_data)
        try:
            _holder = ItemDetailAttributeHolder(attribute_dictionary=self.item_data)
            logger.info(f'Successfully built the item data attribute holder with given item data')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to build ItemDetailAttributeHolder with given data. Aborting.')
            logger.warning(self.item_data)
            logger.exception(e)
            return
        return _holder

    def build_add_to_queue_button(self):
        _button = base_widgets.Button(text="Add to Queue")
        _button.clicked.connect(self.emit_add_to_queue)
        return _button

    def emit_add_to_queue(self):
        print('exports')
        self.AddToQueueButtonClicked.emit(self.attribute_holder.attribute_dictionary())
        return
