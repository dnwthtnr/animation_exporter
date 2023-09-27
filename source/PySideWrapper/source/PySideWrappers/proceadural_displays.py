import os.path
from PySide2 import QtCore, QtWidgets
from functools import partial
from . import (
    base_layouts,
    base_windows,
    constants,
    base_widgets,
    icons,
    line_edits,
    text_edit,
    labels,
    checkbox,
    slider,
    combobox
)


class AbstractAttributeEntry(base_layouts.HorizontalLayout):
    valueEdited = QtCore.Signal(object)

    AutoValueUpdatePolicy = "autoupdate"
    SendValueUpdateRequestPolicy = "requestupdate"

    def __init__(self, attribute_name, attribute_value, update_policy=AutoValueUpdatePolicy, *args, **kwargs):
        super().__init__(spacing=15)
        self.title_label = self.build_attribute_name_label(attribute_name)

        self.attribute_editor_widget = self.attribute_editor(attribute_value)

        self.addWidget(self.title_label, alignment=constants.align_left)
        self.addWidget(self.attribute_editor_widget)

    @property
    def attribute_name(self):
        return self.title_label.text()

    @property
    def attribute_value(self):
        return self.attribute_editor_value(self.attribute_editor_widget)

    def set_title_fixed_width(self, width):
        self.title_label.setFixedWidth(width)

    def attribute_editor(self, attribute_value):
        raise NotImplementedError(f"You must implement {self.__class__.__name__}.attribute_editor()")

    def attribute_editor_value(self, attribute_editor):
        raise NotImplementedError(f"You must implement {self.__class__.__name__}.attribute_editor_value()")

    def build_attribute_name_label(self, name):
        _label = base_widgets.Label(text=name)
        _label.setAlignment(constants.align_right)
        return _label

    def identifier(self, value):
        raise NotImplementedError(f"You must implement {self.__class__.__name__}.identifier()")

    def setReadOnly(self, enabled):
        _attr = getattr(self.attribute_editor_widget, "setReadOnly", None)
        if not callable(_attr):
            return
        self.attribute_editor_widget.setReadOnly(enabled)

    def setAttributeValue(self, newvalue):
        self._setAttributeWidgetValue(self.attribute_editor_widget, newvalue)

    def _setAttributeWidgetValue(self, attribute_editor, newvalue):
        raise NotImplementedError(f"You must implement {self.__class__.__name__}.setAttributeValue()")


class LineEditAttributeEditor(AbstractAttributeEntry):
    IDENTIFIER = str

    def __int__(self, attribute_name, attribute_value, ):
        super().__init__(attribute_name, attribute_value)

    def attribute_editor(self, attribute_value):
        _widget = base_widgets.Line_Edit(text=attribute_value)
        _widget.textEdited.connect(self.valueEdited.emit)
        return _widget

    def attribute_editor_value(self, attribute_editor):
        return attribute_editor.text()

    def identifier(self, value):
        if not isinstance(value, str):
            return False

        return True

    def _setAttributeWidgetValue(self, attribute_editor, newvalue):
        attribute_editor.setText(newvalue)


class BoolComboAttributeEditor(AbstractAttributeEntry):
    IDENTIFIER = bool

    def __int__(self, attribute_name, attribute_value, ):
        super().__init__(attribute_name, attribute_value)

    def attribute_editor(self, attribute_value):
        _widget = combobox.BoolComboBox()
        _widget.setValue(attribute_value)
        _widget.valueChanged.connect(self.valueEdited.emit)
        _widget.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Preferred)
        return _widget

    def attribute_editor_value(self, attribute_editor):
        return attribute_editor.value()

    def identifier(self, value):
        if not isinstance(value, bool):
            return False

        return True

    def _setAttributeWidgetValue(self, attribute_editor, newvalue):
        attribute_editor.setValue(newvalue)


class NameEditorAttributeEditor(AbstractAttributeEntry):
    IDENTIFIER = str

    def __int__(self, attribute_name, attribute_value):
        super().__init__(attribute_name, attribute_value)

    def attribute_editor(self, attribute_value):
        _widget = line_edits.NameEditor(name=attribute_value)
        _widget.textEdited.connect(self.valueEdited.emit)
        _widget.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)
        return _widget

    def attribute_editor_value(self, attribute_editor):
        return attribute_editor.text()

    def identifier(self, value):
        if not isinstance(value, str):
            return False

        return True

    def _setAttributeWidgetValue(self, attribute_editor, newvalue):
        attribute_editor.setText(newvalue)


class FilepathDisplayAttributeEditor(AbstractAttributeEntry):

    def __int__(self, attribute_name, attribute_value):
        super().__init__(attribute_name, attribute_value)

    def attribute_editor(self, attribute_value):
        _widget = line_edits.File_Selection_Line_Edit(filepath=attribute_value)
        return _widget

    def attribute_editor_value(self, attribute_editor):
        return attribute_editor.filepath

    def identifier(self, value):
        if not isinstance(value, str):
            return False
        if not os.path.exists(value):
            return False
        if not os.path.isfile(value):
            return False
        return True


class ChooseDirectoryAttributeEditor(AbstractAttributeEntry):

    def __int__(self, attribute_name, attribute_value):
        super().__init__(attribute_name, attribute_value)

    def attribute_editor(self, attribute_value):
        _widget = line_edits.Folder_Selection_Line_Edit(directory=attribute_value)
        _widget.FileSelected.connect(self.valueEdited.emit)
        return _widget

    def attribute_editor_value(self, attribute_editor):
        return attribute_editor.directory

    def identifier(self, value):
        if not isinstance(value, str):
            return False
        if not os.path.exists(value):
            return False
        if not os.path.isdir(value):
            return False
        return True

    def _setAttributeWidgetValue(self, attribute_editor, newvalue):
        attribute_editor.setText(newvalue)


class LargeListAttributeEditor(AbstractAttributeEntry):

    def __int__(self, attribute_name, attribute_value):
        super().__init__(attribute_name, attribute_value)

    def attribute_editor(self, attribute_value):
        _widget = text_edit.LargeListDisplay(_list=attribute_value)
        return _widget

    def attribute_editor_value(self, attribute_editor):
        return attribute_editor.list()

    def identifier(self, value):
        if not isinstance(value, list):
            return False
        if len(value) < 0:
            return False

        return True


class LargeListTooltipAttributeEditor(AbstractAttributeEntry):

    def __int__(self, attribute_name, attribute_value):
        super().__init__(attribute_name, attribute_value)

    def attribute_editor(self, attribute_value):
        _widget = line_edits.ListToolTipDisplay(_list=attribute_value)
        return _widget

    def attribute_editor_value(self, attribute_editor):
        return attribute_editor.list()

    def identifier(self, value):
        if not isinstance(value, list):
            return False
        if len(value) < 0:
            return False

        # check if all contents are lists
        _contents_list = [isinstance(_item, str) for _item in value]
        if False in _contents_list:
            return False

        return True


class TwoDimentionalLineEditAttributeEditor(AbstractAttributeEntry):

    def __int__(self, attribute_name, attribute_value):
        super().__init__(attribute_name, attribute_value)

    def attribute_editor(self, attribute_value):
        _widget = line_edits.TwoDimensionalFloat(x_val=attribute_value[0], y_val=attribute_value[1])
        _widget.valueChanged.connect(self.valueEdited.emit)
        return _widget

    def attribute_editor_value(self, attribute_editor):
        return [attribute_editor.x_value, attribute_editor.y_value]

    def identifier(self, value):
        if not isinstance(value, list):
            return False
        elif not len(value) == 2:
            return False
        elif type(value[0]) not in [float, int] or type(value[1]) not in [float, int]:
            return False

        return True


class RangeCheckboxArrayAttributeEditor(AbstractAttributeEntry):

    def __int__(self, attribute_name, attribute_value):
        super().__init__(attribute_name, attribute_value)

    def attribute_editor(self, attribute_value):
        _widget = checkbox.RangeCheckboxArray(ranges_list=attribute_value)
        _widget.rangeSelectionChanged.connect(self.valueEdited.emit)
        return _widget

    def attribute_editor_value(self, attribute_editor):
        """

        Parameters
        ----------
        attribute_editor

        Returns
        -------
        list[list]

        """
        return attribute_editor.checked_ranges()

    def identifier(self, value):
        if not isinstance(value, list):
            return False

        # check if all contents are lists
        _contents_list = [isinstance(_item, list) for _item in value]
        if False in _contents_list:
            return False

        # check if all lists are of length 2
        _contents_all_ranges = [len(_item) == 2 for _item in value]
        if False in _contents_all_ranges:
            return False

        # check if all lists hold 2 ints
        for _item in value:
            _item_type_pair = [type(_item[0]), type(_item[1])]
            if _item_type_pair != [float, float] and _item_type_pair != [int, int]:
                return False

        return True


class RangeSliderAttributeEditor(AbstractAttributeEntry):

    def __int__(self, attribute_name, attribute_value):
        super().__init__(attribute_name, attribute_value)

    def attribute_editor(self, attribute_value):
        timeline_range = attribute_value[1]
        timeline_markers = attribute_value[2]
        value = attribute_value[0]
        _widget = slider.RangeListSelector(minimum=timeline_range[0], maximum=timeline_range[1],
                                           range_list=[value], values_to_mark=timeline_markers)
        _widget.rangeListChanged.connect(self.valueEdited.emit)
        return _widget

    def attribute_editor_value(self, attribute_editor):
        """

        Parameters
        ----------
        attribute_editor

        Returns
        -------
        list[list]

        """
        return attribute_editor.ranges()

    def identifier(self, value):

        if not isinstance(value, list):
            return False

        if len(value) != 3:
            return False

        # check if all contents are lists
        if False in [isinstance(item, list) for item in value]:
            return False

        _range = value[1]
        _markers = value[2]
        _attribute_value = value[0]

        if not isinstance(_attribute_value, list):
            return False

        if False in [isinstance(_item, float) for _item in _attribute_value] and False in [isinstance(_item, int) for _item in _attribute_value]:
            return False

        if len(_attribute_value) != 2 or len(_range) != 2:
            return False

        if _range[0] >= _range[-1]:
            return False

        # if len(value) < 2:
        #     return False

        # check if all lists are of length 2
        # _contents_all_ranges = [len(_item) == 2 for _item in _attribute_value]
        # if False in _contents_all_ranges:
        #     return False

        # check if all lists hold 2 ints
        # for _item in value:
        #     _item_type_pair = [type(_item[0]), type(_item[1])]
        #     if _item_type_pair != [float, float] and _item_type_pair != [int, int]:
        #         return False

        return True


class TextListAttributeEditor(AbstractAttributeEntry):

    def __int__(self, attribute_name, attribute_value):
        super().__init__(attribute_name, attribute_value)

    def attribute_editor(self, attribute_value):
        _widget = slider.StringListEditor(textList=attribute_value)
        _widget.textListChanged.connect(self.valueEdited.emit)
        _widget.textListChanged.connect(print)
        return _widget

    def attribute_editor_value(self, attribute_editor):
        """

        Parameters
        ----------
        attribute_editor

        Returns
        -------
        list[list]

        """
        return attribute_editor.textList()

    def identifier(self, value):

        if not isinstance(value, list):
            return False

        if len(value) == 0:
            return False

        # check if all contents are lists
        if False in [isinstance(item, str) for item in value]:
            return False

        return True


class AttributeHolder(base_layouts.Layout):
    valueChanged = QtCore.Signal(str, object)

    # def __new__(cls, *args, **kwargs):
    #     if not hasattr(cls, 'instance'):
    #         cls.instance = super().__new__(cls)
    #     return cls.instance
    def __init__(
            self,
            attribute_dictionary,
            attribute_mapper,
            map_by_type=True,
            map_by_identity=False,
            attributes_to_hide=[],
            non_editable_attributes=[],
            attribute_title_width=150,
            margins=[0, 0, 0, 0],
            spacing=0,
            orientation=constants.vertical
    ):
        super().__init__(
            layout_orientation=orientation,
            margins=margins,
            spacing=spacing
        )
        self.attribute_entries = []
        self.hiddenEntries = []

        if map_by_identity is True:
            if not isinstance(attribute_mapper, list):
                raise TypeError('When mapping by identity attribute mapper must be a a list of callable AbstractAttributeEntry subclasses')
            for _item in attribute_mapper:
                if not issubclass(_item, AbstractAttributeEntry):
                    raise TypeError('When mapping by identity attribute mapper must be a a list of callable AbstractAttributeEntry subclasses')


        self._build(
            attribute_dictionary=attribute_dictionary,
            attribute_mapper=attribute_mapper,
            map_by_identity=map_by_identity,
            map_by_type=map_by_type,
            attribute_title_width=attribute_title_width,
            non_editable_attributes=non_editable_attributes,
            attributes_to_hide=attributes_to_hide
        )

    def _build(self, attribute_dictionary, attribute_mapper, map_by_identity, map_by_type, attribute_title_width, non_editable_attributes, attributes_to_hide):
        for _attribute_name, _attribute_value in sorted(attribute_dictionary.items()):
            _attribute_entry = self.create_attribute_entry(
                attribute_name=_attribute_name,
                attribute_value=_attribute_value,
                attribute_mapper=attribute_mapper,
                map_by_identity=map_by_identity,
                map_by_type=map_by_type
            )
            if _attribute_entry is None:
                continue
            _attribute_entry.set_title_fixed_width(attribute_title_width)
            _attribute_entry.valueEdited.connect(partial(self.valueChanged.emit, _attribute_name))
            self.addWidget(_attribute_entry)

            if _attribute_name in attributes_to_hide:
                _attribute_entry.hide()
                self.hiddenEntries.append(_attribute_entry)
            if _attribute_name in non_editable_attributes:
                _attribute_entry.setReadOnly(True)

            self.attribute_entries.append(_attribute_entry)
        self.addStretch(1)

    def attribute_dictionary(self):
        _attribute_dictionary = {}
        for _entry in self.attribute_entries:
            _attribute_dictionary[_entry.attribute_name] = _entry.attribute_value

        return _attribute_dictionary

    def create_attribute_entry(self, attribute_name, attribute_value, attribute_mapper, map_by_identity, map_by_type):
        if map_by_identity is True:
            return self.create_attribute_entry_by_identity(attribute_name, attribute_value, attribute_mapper)
        if map_by_type is True:
            return self.create_attribute_entry_by_type(attribute_name, attribute_value, attribute_mapper)
        raise NotImplementedError(
            f"You must implement {self.__class__.__name__}.map_attribute() when not automapping by type.")

    def create_attribute_entry_by_identity(self, attribute_name, attribute_value, attribute_mapper):
        for _entry_type in attribute_mapper:
            if _entry_type.identifier(self, value=attribute_value) is True:
                _entry = _entry_type(attribute_name, attribute_value)
                return _entry
        return None

    def create_attribute_entry_by_type(self, attribute_name, attribute_value, attribute_mapper):
        _entry = attribute_mapper[type(attribute_value)]
        return _entry(attribute_name, attribute_value)

    def get_attribute_entry(self, attribute_name):
        for _entry in self.attribute_entries:
            if _entry.attribute_name == attribute_name:
                return _entry

    def update_attribute(self, attribute_name, attribute_value):
        _entry = self.get_attribute_entry(attribute_name)

        _new_entry = self.create_attribute_entry(
            attribute_name=attribute_name,
            attribute_value=attribute_value,
            attribute_mapper=self.attribute_mapper,
            map_by_type=self.map_by_type
        )

        self.replace_entry(_entry, _new_entry)

    def replace_entry(self, entry, newEntry):
        self.replace_widget(widget=entry, newWidget=newEntry)

        _index = self.attribute_entries.index(entry)
        self.attribute_entries.pop(_index)
        self.attribute_entries.insert(_index, newEntry)

    def setHiddenAttributeVisibility(self, visible):
        for _entry in self.hiddenEntries:
            _entry.setVisible(visible)
        return


if __name__ == "__main__":
    class attr(AbstractAttributeEntry):

        def __init__(self):
            super().__init__(attr)
