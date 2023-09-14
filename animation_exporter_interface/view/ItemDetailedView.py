import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)

from PySide2 import QtCore

from animation_exporter.utility_resources import keys, userSettings
import math_operations

from pyqt_interface_elements import base_widgets, base_layouts, base_windows, constants, proceadural_displays, styles

_attrs = [
    proceadural_displays.RangeSliderAttributeEditor,
    proceadural_displays.TwoDimentionalLineEditAttributeEditor,
    proceadural_displays.ChooseDirectoryAttributeEditor,
    proceadural_displays.LineEditAttributeEditor,
    proceadural_displays.FilepathDisplayAttributeEditor,
    proceadural_displays.LargeListTooltipAttributeEditor,
]

# TODO: Switch this all out and write these things to disk for the attribute display to read. something different
# even being decoupled it is still too coupled

class ItemDetailAttributeHolder(proceadural_displays.AttributeHolder):


    def __init__(self, attribute_dictionary, animation_times, animation_range):
        self.animation_times = animation_times
        self.animation_range = animation_range
        super().__init__(
            attribute_dictionary=attribute_dictionary,
            attribute_mapper=_attrs,
            orientation=constants.vertical,
            map_by_type=False,
            attributes_to_hide=userSettings.itemViewHiddenAttributes()
        )

    def create_attribute_entry(self, attribute_name, attribute_value, attribute_mapper, map_by_identity, map_by_type):
        for _entry_type in attribute_mapper:

            if _entry_type == proceadural_displays.RangeSliderAttributeEditor:
                _attribute_value = [attribute_value, self.animation_range, self.animation_times]
            else:
                _attribute_value = attribute_value

            if _entry_type.identifier(self, value=_attribute_value) is True:
                _entry = _entry_type(attribute_name, _attribute_value)
                return _entry
        return None


class ItemDetailedView(base_layouts.VerticalLayout):
    AddToQueueButtonClicked = QtCore.Signal()

    valueChanged = QtCore.Signal(str, object)

    dataRequest = QtCore.Signal()

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def finish_initialization(self):
        self.dataRequest.emit()

    @QtCore.Slot()
    def populate_detail_view(self, item_data):
        self.attribute_holder = self.build_attribute_holder(item_data)
        _button = self._buildAddToQueueButton()

        self.addWidget(self.attribute_holder)
        self.addWidget(_button, alignment=constants.align_right)
        self.setStyleSheet(styles.maya_detail_view)


    def build_attribute_holder(self, item_data):
        logger.info(f'Building item data attribute holder with given item data')
        logger.debug(item_data)
        try:
            _animation_keyframes = item_data.get(keys.animation_times)
            _animation_range = item_data.get(keys.animation_range_key)
            if _animation_range is None:
                _animation_range = [0, 100]
                _animation_keyframes = []

            _holder = ItemDetailAttributeHolder(attribute_dictionary=item_data, animation_range=_animation_range, animation_times=_animation_keyframes)
            _holder.valueChanged.connect(self.valueChanged.emit)
            logger.info(f'Successfully built the item data attribute holder with given item data')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to build ItemDetailAttributeHolder with given data. Aborting.')
            logger.warning(item_data)
            logger.exception(e)
            return
        return _holder

    def _buildAddToQueueButton(self):
        _button = base_widgets.Button(text="Add to Queue")
        _button.setMinimumSize(115, 35)
        _button.clicked.connect(self.emit_add_to_queue)
        return _button

    def emit_add_to_queue(self):
        self.AddToQueueButtonClicked.emit()
