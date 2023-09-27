import copy
from PySide2 import QtCore, QtWidgets, QtGui
from . import base_widgets, constants, styles, base_layouts, line_edits, icons
from functools import partial

class RangeSlider(base_widgets.Slider):
    sliderMoved = QtCore.Signal(float, float)

    def __init__(self, minimum, maximum, values_to_mark=[], threshold=1):
        super().__init__()
        self.threshold = threshold
        self.setOrientation(constants.horizontal)

        self._marked_values = values_to_mark

        self.setMinimum(minimum)
        self.setMaximum(maximum)

        self._lower_bound = 50
        self._upper_bound = self.maximum()

        self._pressed_element = None
        self.setMinimumHeight(50)

    # region Value Setters

    def setValuesToMark(self, values):
        """
        Set values to paint markers at

        Parameters
        ----------
        values : list[int] or list[float]

        Returns
        -------

        """
        if not isinstance(values, list):
            return
        for _value in values:
            if not isinstance(_value, int) and not isinstance(_value, float):
                return

        self._marked_values = values

    def valuesToMark(self):
        """
        Values to paint markers at

        Returns
        -------

        """
        return self._marked_values

    def addValueToMark(self, value):
        """
        Adds a value to paint a marker at

        Parameters
        ----------
        value

        Returns
        -------

        """
        self._marked_values.append(value)

    def removeValueToMark(self, value):
        """
        Removes the given value from the values to paint markers at if it is present

        Parameters
        ----------
        value : int or float

        """
        if value in self.valuesToMark():
            _index = self._marked_values.index(value)
            self._marked_values.pop(_index)

    def lowerBound(self):
        if self.threshold == 1:
            return int(self._lower_bound)
        return self._lower_bound

    def setLowerBound(self, value):
        self._lower_bound = value
        self.update()

    def upperBound(self):
        if self.threshold == 1:
            return int(self._upper_bound)
        return self._upper_bound

    def setUpperBound(self, value):
        self._upper_bound = value
        self.update()

    # endregion

    def paintEvent(self, event):
        painter = QtGui.QPainter(self)
        style = QtWidgets.QApplication.style()

        # self.paint

        # self.paintSliderGroove(painter, style)

        # self.paintTickMarks(_groove_control_rect, painter, style)

        self.paintSelectedRange(painter, style)
        self.paintTickMarks(painter, style)
        self.paintSliderHandles(painter=painter, style=style)
        self.paintMarkers(painter, style)
        return

    # region Painters
    def paintSliderHandle(self, handle_value):
        """
        Paints a slider handle at the given value

        Parameters
        ----------
        handle_value : float
            The value to draw the slider handle at

        Returns
        -------
        QtWidgets.QStyleOptionSlider
            A slider style option defining the slider handle

        """
        opt = QtWidgets.QStyleOptionSlider()
        self.initStyleOption(opt)

        # Only draw the groove for the first slider so it doesn't get drawn
        # on top of the existing ones every time
        opt.subControls = QtWidgets.QStyle.SC_SliderHandle

        # if self.tickPosition() != self.NoTicks:
        #     opt.subControls |= QtWidgets.QStyle.SC_SliderTickmarks

        opt.sliderPosition = handle_value
        opt.sliderValue = handle_value
        return opt

    def paintSliderHandles(self, painter, style):
        """
        Draws the handles for the upper and lower bound

        Parameters
        ----------
        painter : QtGui.QPainter
            TYhe painter to be used to draw teh slider handles
        style : QtWidgets.QStyle
            The style for the current QApplication

        """
        for i, _handle_value in enumerate([self._lower_bound, self._upper_bound]):
            _slider_handle_style_option = self.paintSliderHandle(handle_value=_handle_value)
            style.drawComplexControl(QtWidgets.QStyle.CC_Slider, _slider_handle_style_option, painter, self)

    def paintSliderGroove(self, painter, style):
        _opt = QtWidgets.QStyleOptionSlider()
        self.initStyleOption(_opt)

        _opt.sliderValue = 0
        _opt.sliderPosition = 0
        _opt.subControls = QtWidgets.QStyle.SC_SliderGroove
        self.setTickPosition(self.TicksBothSides)
        _opt.subControls = QtWidgets.QStyle.SC_SliderTickmarks

        # style.drawComplexControl(QtWidgets.QStyle.CC_Slider, _opt, painter, self)

        _palette = QtGui.QPalette()
        _palette.setColor(QtGui.QPalette.Window, QtGui.QColor(255, 0, 0))


        style.drawComplexControl(QtWidgets.QStyle.CC_Slider, _opt, painter, self)

    def paintSelectedRange(self, painter, style):
        """

        Parameters
        ----------
        painter
        style : QtWidget.QStyle

        Returns
        -------

        """

        _pixel_upper_limit = self.slider_value_to_pixel_value(self.upperBound())
        _pixel_lower_limit = self.slider_value_to_pixel_value(self.lowerBound())

        _slider_top = self.rect().top()
        _slider_bottom = self.rect().bottom()

        _top_left = QtCore.QPoint(_pixel_lower_limit + 5, _slider_top)
        _bottom_right   = QtCore.QPoint(_pixel_upper_limit - 5, _slider_bottom)

        _selection_rectangle = QtCore.QRect(_top_left, _bottom_right)

        _color = QtGui.QColor(155, 155, 155, 150)

        painter.fillRect(_selection_rectangle, _color)

    def paintMarkers(self, painter, style):
        """
        Paints markers
        Parameters
        ----------
        painter
        style

        Returns
        -------

        """
        for _handle_value in self.valuesToMark():
            _pixel_value = self.slider_value_to_pixel_value(_handle_value)
            _top = self.rect().top()

            _top_left = QtCore.QPoint(_pixel_value, _top)
            _bottom_right = QtCore.QPoint(_pixel_value + 1, self.rect().bottom())

            _rect = QtCore.QRect(_top_left, _bottom_right)

            _color = QtGui.QColor(255, 10, 20, 150)

            painter.fillRect(_rect, _color)


    def paintTickMarks(self, painter, style):
        _multiple_of = 20
        _draw_number = False
        for _value in range(self.minimum(), self.maximum()):

            _result = _value / _multiple_of
            if not _result.is_integer():
                continue

            _pixel_value = self.slider_value_to_pixel_value(_value)
            _top = self.rect().center().y()
            _bottom = self.rect().bottom()


            _top_left = QtCore.QPoint(_pixel_value, _top)
            _bottom_right = QtCore.QPoint(_pixel_value + 3, _bottom)

            _rect = QtCore.QRect(_top_left, _bottom_right)

            _color = QtGui.QColor(100, 100, 100, 255)

            painter.fillRect(_rect, _color)

            # if _draw_number is False:
            #     _draw_number = True
            #     continue

            painter.drawText(QtCore.QPoint(_pixel_value+6, _bottom-1), str(_value))
            _draw_number = False

    # endregion

    def mousePressEvent(self, event):
        event.accept()

        _widget_style = QtWidgets.QApplication.style()
        _button = event.button()

        if _button is None:
            event.ignore()
            return

        _slider_style_option = QtWidgets.QStyleOptionSlider()
        self.initStyleOption(_slider_style_option)

        self.active_slider = -1

        for slider_index, slider_value in enumerate([self._lower_bound, self._upper_bound]):
            _slider_style_option.sliderPosition = slider_value
            _element_clicked_on = _widget_style.hitTestComplexControl(_widget_style.CC_Slider, _slider_style_option,
                                                                      event.pos(), self)

            if _element_clicked_on == _widget_style.SC_SliderHandle:
                self.active_slider = slider_index
                self._pressed_element = _element_clicked_on

                self.triggerAction(self.SliderMove)
                self.setRepeatAction(self.SliderNoAction)
                self.setSliderDown(True)
                break

    def mouseMoveEvent(self, event):
        if self._pressed_element != QtWidgets.QStyle.SC_SliderHandle:
            event.ignore()
            return

        event.accept()
        _slider_axis_pixel_value = self.point_dimension_for_orientation(event.pos())
        _new_position = self.pixel_value_to_slider_value(_slider_axis_pixel_value)

        if self.active_slider == 0:
            if _new_position >= self._upper_bound:
                _new_position = self._upper_bound - 1
            self._lower_bound = _new_position

        if self.active_slider == 1:
            if _new_position <= self._lower_bound:
                _new_position = self._lower_bound + 1
            self._upper_bound = _new_position

        self.update()

        self.sliderMoved.emit(self._lower_bound, self._upper_bound)


    # region
    def point_dimension_for_orientation(self, point):
        return point.x() if self.orientation() == constants.horizontal else point.y()

    def pixel_value_to_slider_value(self, slider_axis_pixel_value):
        """
        Given a pixel value contained within the slider this will return the slider logic value it is equivalent to

        Parameters
        ----------
        slider_axis_pixel_value : int
            The appropriate pixel value on the correct axis for the slider orientation

        Returns
        -------
        float
            The slider value

        """
        slider_axis_pixel_value = self.mapFromParent(QtCore.QPoint(slider_axis_pixel_value, 0)).x()


        _widget_geometry_minimum_pixel_local  =  self.rect().left()
        _widget_geometry_maximum_pixel_local = self.rect().right()


        if self.orientation() == constants.horizontal:
            _widget_geometry_minimum_pixel_global =  self.mapFromParent(
                QtCore.QPoint(_widget_geometry_minimum_pixel_local, 0)
            )
            _widget_geometry_maximum_pixel_global = self.mapFromParent(
                QtCore.QPoint(_widget_geometry_maximum_pixel_local, 0)
            )
        else:
            _widget_geometry_minimum_pixel_global =  self.mapFromParent(
                QtCore.QPoint(0, _widget_geometry_minimum_pixel_local)
            )
            _widget_geometry_maximum_pixel_global = self.mapFromParent(
                QtCore.QPoint(0, _widget_geometry_maximum_pixel_local)
            )

        _widget_geometry_minimum = self.point_dimension_for_orientation(_widget_geometry_minimum_pixel_global)
        _widget_geometry_maximum = self.point_dimension_for_orientation(_widget_geometry_maximum_pixel_global)


        _widget_geometry_pixel_range = _widget_geometry_maximum - _widget_geometry_minimum
        _widget_geometry_pixel_lower_limit = slider_axis_pixel_value - _widget_geometry_minimum

        _difference_ratio = _widget_geometry_pixel_lower_limit / _widget_geometry_pixel_range

        _slider_range = self.maximum() - self.minimum()

        _val = _slider_range * _difference_ratio

        # return _val
        # region###############################

        _slider_style_option = QtWidgets.QStyleOptionSlider()
        self.initStyleOption(_slider_style_option)
        _widget_style = QtWidgets.QApplication.style()

        _slider_groove_geometry = _widget_style.subControlRect(
            _widget_style.CC_Slider,
            _slider_style_option,
            _widget_style.SC_SliderGroove,
            self
        )
        _slider_handle_geometry = _widget_style.subControlRect(
            _widget_style.CC_Slider,
            _slider_style_option,
            _widget_style.SC_SliderHandle,
            self
        )

        if self.orientation() == constants.horizontal:
            _slider_length = _slider_handle_geometry.width()
            _slider_min = _slider_groove_geometry.x()
            _slider_max = _slider_groove_geometry.right() - _slider_length + 1
        else:
            _slider_length = _slider_handle_geometry.height()
            _slider_min = _slider_groove_geometry.y()
            _slider_max = _slider_groove_geometry.bottom() - _slider_length + 1

        _slider_lower_span = slider_axis_pixel_value - _slider_min
        _slider_upper_span = _slider_max - _slider_min

        _slider_value = _widget_style.sliderValueFromPosition(
            self.minimum(),
            self.maximum(),
            _slider_lower_span,
            _slider_upper_span,
            _slider_style_option.upsideDown
        )

        return _val

    def slider_value_to_pixel_value(self, slider_value):
        """
        Given a slider logic value this will return the pixel value it is equivalent to

        Parameters
        ----------
        slider_value : int
            The slider value

        Returns
        -------
        float
            The appropriate pixel value on the correct axis for the slider orientation

        """
        _widget_geometry_minimum_pixel_local  =  self.rect().left()
        _widget_geometry_maximum_pixel_local = self.rect().right()

        if self.orientation() == constants.horizontal:
            _widget_geometry_minimum_pixel_global =  self.mapFromParent(
                QtCore.QPoint(_widget_geometry_minimum_pixel_local, 0)
            )
            _widget_geometry_maximum_pixel_global = self.mapFromParent(
                QtCore.QPoint(_widget_geometry_maximum_pixel_local, 0)
            )
        else:
            _widget_geometry_minimum_pixel_global =  self.mapFromParent(
                QtCore.QPoint(0, _widget_geometry_minimum_pixel_local)
            )
            _widget_geometry_maximum_pixel_global = self.mapFromParent(
                QtCore.QPoint(0, _widget_geometry_maximum_pixel_local)
            )


        _widget_geometry_minimum = self.point_dimension_for_orientation(_widget_geometry_minimum_pixel_global)
        _widget_geometry_maximum = self.point_dimension_for_orientation(_widget_geometry_maximum_pixel_global)

        _slider_range = self.maximum() - self.minimum()
        _slider_lower_limit = slider_value - self.minimum()

        _difference_ratio = _slider_lower_limit / _slider_range

        _widget_geometry_span = _widget_geometry_maximum - _widget_geometry_minimum

        _val = _widget_geometry_span * _difference_ratio

        return _val

        ################
        #
        # _slider_style_option = QtWidgets.QStyleOptionSlider()
        # self.initStyleOption(_slider_style_option)
        # _widget_style = QtWidgets.QApplication.style()
        #
        # _slider_groove_geometry = _widget_style.subControlRect(
        #     _widget_style.CC_Slider,
        #     _slider_style_option,
        #     _widget_style.SC_SliderGroove,
        #     self
        # )
        # _slider_handle_geometry = _widget_style.subControlRect(
        #     _widget_style.CC_Slider,
        #     _slider_style_option,
        #     _widget_style.SC_SliderHandle,
        #     self
        # )
        #
        # if self.orientation() == constants.horizontal:
        #     _slider_length = _slider_handle_geometry.width()
        #     _slider_min = _slider_groove_geometry.x()
        #     _slider_max = _slider_groove_geometry.right() - _slider_length + 1
        # else:
        #     _slider_length = _slider_handle_geometry.height()
        #     _slider_min = _slider_groove_geometry.y()
        #     _slider_max = _slider_groove_geometry.bottom() - _slider_length + 1
        #
        # _slider_lower_span = slider_value - self.minimum()
        # _slider_upper_span = self.maximum() - self.minimum()
        #
        # _position = _widget_style.sliderPositionFromValue(_slider_min, _slider_max, slider_value, _slider_lower_span, _slider_upper_span)
        # return _position


class RangeSelector(base_layouts.HorizontalLayout):
    rangeSelected = QtCore.Signal(float, float)

    def __init__(self, minimum, maximum, values_to_mark=[]):
        """
        Widget to select a range within a set maximum and minimum on a timeline

        Parameters
        ----------
        minimum : float:
            The minimum value to allow on the timeline for selection
        maximum : float:
            The maximum value to allow on the timeline for selection
        values_to_mark : list[float]
            Timeline values to place markers at
        """
        super().__init__()
        self._range_slider = self._build_range_slider(minimum, maximum, values_to_mark)
        self._select_button = self._build_select_button(text="Select")

        self.addWidget(self._range_slider)
        self.addWidget(self._select_button, alignment=constants.align_right)

    def _build_range_slider(self, minimum, maximum, values_to_mark=[]):
        """
        Builds the timeline slider to select ranges from

        Parameters
        ----------
        minimum : float:
            The minimum value to allow on the timeline for selection
        maximum : float:
            The maximum value to allow on the timeline for selection
        values_to_mark : list[float]
            Timeline values to place markers at

        Returns
        -------
        RangeSlider
            The slider

        """
        _widget = RangeSlider(minimum, maximum, values_to_mark)
        _widget.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)
        return _widget

    def _build_select_button(self, text):
        """
        Builds a button to commit the selected range

        Parameters
        ----------
        text : str
            Text to display on button

        Returns
        -------
        base_widgets.Button
            The new button

        """
        _widget = base_widgets.Button(text=text)
        _widget.setMinimumWidth(60)
        # _widget.setIcon(icons.plus)
        _widget.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)
        _widget.clicked.connect(self.selectButtonClicked)
        return _widget

    @QtCore.Slot()
    def selectButtonClicked(self):
        self.rangeSelected.emit(self._range_slider.lowerBound(), self._range_slider.upperBound())



class RangeElement(base_layouts.HorizontalLayout):
    deleted = QtCore.Signal(object)
    rangeChanged = QtCore.Signal(list)

    def __init__(self, min, max):
        super().__init__()

        self._range_line_edit = self._build_range_line_edit(min, max)
        self._delete_button = self._build_delete_button()

        self.addWidget(self._range_line_edit)
        self.addWidget(self._delete_button)

    def range(self):
        return self._range_line_edit.value

    def setRange(self, range):
        self._range_line_edit.set_x_value(range[0])
        self._range_line_edit.set_x_value(range[1])

    def _build_range_line_edit(self, min, max):
        _range_widget = line_edits.TwoDimensionalFloat(min, max)
        _range_widget.valueChanged.connect(self._rangeValueChanged)

        return _range_widget

    def _rangeValueChanged(self, *args):
        self.rangeChanged.emit(self.range())

    def _build_delete_button(self):
        _widget = base_widgets.Tool_Button()
        _widget.setIcon(icons.delete)
        _widget.clicked.connect(self._delete)
        return _widget

    @QtCore.Slot()
    def _delete(self):
        self.deleted.emit(self)
        self.deleteLater()



class RangeListEditor(base_layouts.VerticalScrollArea):
    rangeListChanged = QtCore.Signal()

    def __init__(self, ranges=[]):
        """
        Widget to manage a list of ranges

        Parameters
        ----------
        ranges : list[list[float, float]]
            The list of ranges to display
        """
        super().__init__()
        self._range_widgets = []
        self.addStretch(1)
        self.addRanges(ranges)
        self.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)

    def ranges(self):
        """
        The ranges currently being displayed

        Returns
        -------
        list[list[float, float]]
            List of the ranges

        """
        _range_list = []
        for _range_widget in self._range_widgets:
            _range = _range_widget.range()
            _range_list.append(_range)
        return _range_list

    def addRange(self, range):
        """
        Builds a widget to display the given range and adds it

        Parameters
        ----------
        range : list[float, float]
            Range to add to list

        """
        _range_editor = RangeElement(range[0], range[1])
        _range_editor.rangeChanged.connect(self.rangeElementChanged)
        _range_editor.deleted.connect(self.removeRange)
        self._range_widgets.append(_range_editor)
        self.addWidget(_range_editor)
        self.rangeListChanged.emit()

    def rangeElementChanged(self, range):
        self.rangeListChanged.emit()

    def removeRange(self, range_widget):
        """
        Removes the given range widget

        Parameters
        ----------
        range_widget : RangeElement
            The range element to remove

        """
        _index = self._range_widgets.index(range_widget)
        self._range_widgets.pop(_index)
        self.rangeListChanged.emit()

    def addRanges(self, ranges):
        """
        Adds a list of ranges to the display

        Parameters
        ----------
        ranges : list[list[float, float]]
            Ranges to add to display

        """
        for _range in ranges:
            self.addRange(_range)



class RangeListSelector(base_layouts.Splitter):
    rangeListChanged = QtCore.Signal(object)

    def __init__(self, minimum, maximum, range_list=[], values_to_mark=[]):
        """
        Widget to select a range within a set maximum and minimum on a timeline

        Parameters
        ----------
        minimum : float:
            The minimum value to allow on the timeline for selection
        maximum : float:
            The minimum value to allow on the timeline for selection
        range_list
        values_to_mark
        """
        super().__init__(orientation=constants.vertical)

        self._range_selector = self._build_range_selector(minimum, maximum, values_to_mark)
        self._range_list_editor = self._build_range_list_editor(range_list)

        self.addWidget(self._range_selector)
        self.addWidget(self._range_list_editor)
        self.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)

    def ranges(self):
        return self._range_list_editor.ranges()

    def _build_range_selector(self, minimum, maximum, values_to_mark=[]):
        _widget = RangeSelector(minimum, maximum, values_to_mark)
        _widget.rangeSelected.connect(self.rangeSelected)
        return _widget

    @QtCore.Slot()
    def rangeSelected(self, min, max):
        self._range_list_editor.addRange([min, max])

    def _build_range_list_editor(self, range_list):
        _widget = RangeListEditor(range_list)
        _widget.rangeListChanged.connect(self.emitRangeListChanged)
        return _widget

    def emitRangeListChanged(self):
        self.rangeListChanged.emit(self.ranges())




class StringElement(base_layouts.HorizontalLayout):
    deleted = QtCore.Signal(object)
    textEdited = QtCore.Signal(list)

    def __init__(self, text):
        super().__init__()

        self._lineEdit = line_edits.DoubleClickLabel(text=text)
        self._lineEdit.textEdited.connect(self.textChanged)

        self.addWidget(self._lineEdit)

    def text(self):
        return self._lineEdit.getCachedText()

    def setText(self, text):
        self._lineEdit.setText(text)

    def textChanged(self, *args):
        self.textEdited.emit(self.text())

    def installEventFilter(self, filterObj):
        if len(self.children()) > 0:
            for _child in self.children():
                _child.installEventFilter(filterObj)

    @QtCore.Slot()
    def _delete(self):
        self.deleteLater()

class StringListEditor(base_layouts.VerticalLayout):
    textListChanged = QtCore.Signal(list)

    _call = 0
    def __init__(self, textList=[]):
        """
        Widget to manage a list of ranges

        Parameters
        ----------
        ranges : list[list[float, float]]
            The list of ranges to display
        """
        super().__init__()
        _toolbar = self._buildToolBar()

        self.textHolder = base_layouts.VerticalSelectableObjectHolder()
        self.textHolder.addStretch(1)
        # self.textHolder.addStretch(1)
        _holderScrollWidget = base_layouts.VerticalScrollArea()
        _holderScrollWidget.addWidget(self.textHolder)

        self.addWidget(_holderScrollWidget)
        self.addWidget(_toolbar)

        self.addTextList(textList)
        self.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)

    def _buildToolBar(self):
        _addButton = self._buildAddButton()
        _deleteButton = self._buildDeleteButton()

        _widget = base_layouts.HorizontalLayout()
        _widget.addStretch(1)
        _widget.insertWidget(-1, _addButton)
        _widget.insertWidget(-1, _deleteButton)
        return _widget

    def _buildAddButton(self):
        """
        Builds a button displaying the duplicate icon that calls duplicate_queue_button_clicked when clicked

        Returns
        -------
        base_widgets.Tool_Button
            The new button

        """
        _widget = base_widgets.Tool_Button()
        _widget.setToolTip(f'Add new queue')
        _widget.setIcon(icons.plus)
        _widget.clicked.connect(partial(self.addText, ''))
        return _widget

    def _deleteButtonClickEvent(self):
        _selectedTextWidgets = self.textHolder.currentSelection()
        for _textWidget in _selectedTextWidgets:
            self.textHolder.disown_child(_textWidget)

    def textList(self):
        """
        The ranges currently being displayed

        Returns
        -------
        list[list[float, float]]
            List of the ranges

        """
        _list = []
        for _selLayout in self.textHolder.selectionLayouts():
            _widget = _selLayout.children()[0]
            _text = _widget.text()
            _list.append(_text)

        return _list

    def addText(self, text):
        """
        Builds a widget to display the given range and adds it

        Parameters
        ----------
        range : list[float, float]
            Range to add to list

        """
        _widget = StringElement(text=text)
        _widget.textEdited.connect(self.textListEditEvent)
        self.textHolder.addWidget(_widget)
        self.textListEditEvent()

    def _buildDeleteButton(self):
        _widget = base_widgets.Tool_Button()
        _widget.setIcon(icons.delete)
        _widget.setToolTip(f"Delete Selected")
        _widget.clicked.connect(self._deleteButtonClickEvent)
        return _widget


    def addTextList(self, textList):
        """
        Adds a list of ranges to the display

        Parameters
        ----------
        ranges : list[list[float, float]]
            Ranges to add to display

        """
        for _text in textList:
            self.addText(_text)

    def textListEditEvent(self, *args):
        self.textListChanged.emit(self.textList())


if __name__ == "__main__":
    import sys

    _app = QtWidgets.QApplication(sys.argv)

    _window = RangeListSelector(0, 100)
    # _vuiew = QtWidgets.QGraphicsView()
    # _vuiew.setScene(_scene)
    #
    # _window = base_layouts.VerticalLayout()
    # _window.addWidget(_vuiew)
    _window.show()

    sys.exit(_app.exec_())
