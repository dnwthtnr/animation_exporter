import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

import base_layouts, base_widgets, line_edits, buttons, icons
from PySide2 import QtWidgets, QtCore
from functools import partial

# TODO: finish range selection
# TODO: fix how custom range is added to range array

# TODO: polish and add ability to add new custom ranges

class Checkbox(buttons.ToggleIconButton):
    checked = QtCore.Signal()
    unchecked = QtCore.Signal()

    def __init__(self):
        super().__init__(enabled_icon=icons.checkbox_checked, disabled_icon=icons.checkbox_unchecked)
        self.enabled.connect(self.checked.emit)
        self.disabled.connect(self.unchecked.emit)


class CheckBoxLayout(base_layouts.HorizontalLayout):
    checked = QtCore.Signal()
    unchecked = QtCore.Signal()
    stateChanged = QtCore.Signal()

    def __init__(self):
        super().__init__()
        self.checkbox = Checkbox()
        self.checkbox.checked.connect(self.checked.emit)
        self.checkbox.unchecked.connect(self.unchecked.emit)
        self.checkbox.checked.connect(self.stateChanged.emit)
        self.checkbox.unchecked.connect(self.stateChanged.emit)
        self.addWidget(self.checkbox)

    def setChecked(self, checked):
        self.checkbox.setIconState(checked)


class TwoDimensionalCheckBox(CheckBoxLayout):

    def __init__(self, range):
        super().__init__()
        self.two_dimensional_editor = line_edits.TwoDimensionalFloat(x_val=range[0], y_val=range[1])
        self.addWidget(self.two_dimensional_editor)

    def value(self):
        return self.two_dimensional_editor.value


class CheckboxManager(QtCore.QObject):
    selectionChanged = QtCore.Signal()

    def __init__(self, allowed_checked_limit=5):
        super().__init__()
        self._checked_limit = allowed_checked_limit

        self.checkboxes = {}
        self.checked = []

    def checkedLimit(self):
        return self._checked_limit

    def checkedCount(self):
        return len(self.checked)

    def currentlyChecked(self):
        """
        The currently checked checkboxes

        Returns
        -------

        """
        return self.checked

    def addCheckBox(self, checkbox_instance, checkbox_checked_signal, checkbox_unchecked_signal, uncheck_checkbox_callable):
        """
        Adds checkbox
        Parameters
        ----------
        checkbox_instance
        checkbox_checked_signal
        uncheck_checkbox_callable

        Returns
        -------

        """
        checkbox_checked_signal.connect(partial(self.checkboxChecked, checkbox_instance))
        checkbox_checked_signal.connect(self.selectionChanged.emit)

        checkbox_unchecked_signal.connect(partial(self.checkboxUnchecked, checkbox_instance))
        checkbox_unchecked_signal.connect(self.selectionChanged.emit)



        self.checkboxes[checkbox_instance] = uncheck_checkbox_callable

    @QtCore.Slot()
    def checkboxChecked(self, checkbox):
        self.checked.append(checkbox)
        if self.checkedCount() > self.checkedLimit():
            _checkbox_to_uncheck = self.checked[0]

            _uncheck_checkbox_callable = self.checkboxes[_checkbox_to_uncheck]
            _uncheck_checkbox_callable()

            logger.debug(f'Unchecked checkbox: {_checkbox_to_uncheck}')

    @QtCore.Slot()
    def checkboxUnchecked(self, checkbox):
        _checkbox_index = self.checked.index(checkbox)
        self.checked.pop(_checkbox_index)


class RangeCheckboxArray(base_layouts.VerticalLayout):
    rangeSelectionChanged = QtCore.Signal(list)

    def __init__(self, ranges_list, custom_range_box=True, spacing=0, checkbox_spacing=15, checkbox_width=0, row_max=4):
        super().__init__(spacing=spacing)

        self.editors = []
        self.checkbox_manager = CheckboxManager()
        self.checkbox_manager.selectionChanged.connect(self.emit_selection_changed)


        # TODO: SIMPLIFY -- Break this shit up

        _row = base_layouts.HorizontalLayout(spacing=spacing)
        _row.addStretch(1)

        if custom_range_box is True:
            ranges_list.insert(-1, [])
        for _range_list in ranges_list:
            if _range_list == []:
                _range_list = [0, 0]
                _range_editor = TwoDimensionalCheckBox(range=_range_list)
                _custom_range_label = base_widgets.Label(text="Custom Range")
                _range_editor.insertWidget(1, _custom_range_label)
            else:
                _range_editor = TwoDimensionalCheckBox(range=_range_list)

            if checkbox_width > 0:
                _range_editor.setFixedWidth(checkbox_width)

            _range_editor.stateChanged.connect(self.emit_selection_changed)
            self.checkbox_manager.addCheckBox(
                checkbox_instance=_range_editor,
                checkbox_unchecked_signal=_range_editor.unchecked,
                checkbox_checked_signal=_range_editor.checked,
                uncheck_checkbox_callable=partial(_range_editor.setChecked, False)
            )

            _row.addWidget(_range_editor)
            self.editors.append(_range_editor)
            if _row.childCount() == row_max:
                self.addWidget(_row)
                _row = base_layouts.HorizontalLayout(spacing=spacing)
                _row.addStretch(1)

        self.addWidget(_row)

    def checked_ranges(self):
        _selected_ranges = [_checkbox.value() for _checkbox in self.checkbox_manager.currentlyChecked()]
        logger.debug(f'Selected ranges: {_selected_ranges}')
        return _selected_ranges

    @QtCore.Slot()
    def emit_selection_changed(self):
        self.rangeSelectionChanged.emit(self.checked_ranges())

if __name__ == "__main__":
    import sys

    _app = QtWidgets.QApplication(sys.argv)

    try:
        _window = RangeCheckboxArray(ranges_list=[
            [10, 200],
            [10, 200],
            [10, 200],
            [10, 200],
            [10, 200],
            [10, 200],
            [10, 200],
            [10, 200],
            [10, 200],
            [10, 200],
            [10, 200],
            [10, 200]
        ])
        _window.show()

        _window.checked_ranges()
    except Exception as e:
        print(e)

    sys.exit(_app.exec_())
