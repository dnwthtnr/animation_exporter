from . import constants, base_layouts, base_widgets, base_windows, icons, buttons, line_edits
from PySide2 import QtCore, QtWidgets, QtGui
from functools import partial
import os


import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)


class DropdownLayout(base_layouts.VerticalScrollArea):
    childClicked = QtCore.Signal(object)
    escapeClicked = QtCore.Signal()
    
    def __init__(self, close_on_escape=False, margins=[0, 0, 0, 0], spacing=0):
        super().__init__(margins=margins, spacing=spacing)
        self.close_on_escape = close_on_escape
        self.setWindowFlags(QtCore.Qt.Popup)

    def keyPressEvent(self, event):
        _key = event.key()
        if _key == QtCore.Qt.Key_Escape:
            if self.close_on_escape is False:
                self.escapeClicked.emit()
            else:
                self.hide()
        super().keyPressEvent(event)

    def mouseReleaseEvent(self, event):
        print('release')
        _mouse_button = event.button()
        if _mouse_button == QtCore.Qt.LeftButton:
            _mouse_position_LOCAL = event.localPos()
            _child_widget_at_point = self.get_child_at_position(_mouse_position_LOCAL)
            self.childWidgetClicked(_child_widget_at_point)
            pass

        return super().mouseReleaseEvent(event)

    def childWidgetClicked(self, widget):
        logger.debug(f'Child widget clicked in class: {self.__class__.__name__}. Name: {widget}')
        # TODO: make it so that if widget is None, deselect any selected stuff
        if not None:
            self.childClicked.emit(widget)





class DropdownBar(base_layouts.HorizontalLayout):
    dropdownClicked = QtCore.Signal(bool)   # True if dropped down

    def finish_initialization(self):

        self.dropdown_button = self._build_button()
        self.selected_label = self._build_label()

        if self.dropdown_on_left is True:
            self.addWidget(self.dropdown_button, alignment=constants.align_left)
            self.addWidget(self.selected_label)
        else:
            self.addWidget(self.selected_label)
            self.addWidget(self.dropdown_button, alignment=constants.align_right)


    def __init__(self, dropdown_on_left=False, margins=[0, 0, 0, 0], spacing=0):
        super().__init__(margins=margins, spacing=spacing)
        self.dropdown_on_left = dropdown_on_left
        self.finish_initialization()

    def bottom_left_global_point(self):
        _dropdown_bar_geometry = self.rect()
        _dropdown_bottom_left_point_LOCAL = _dropdown_bar_geometry.bottomLeft()

        _parent = self.parent()
        if _parent is None:
            return self.mapToParent(_dropdown_bottom_left_point_LOCAL)
        else:
            _dropdown_bottom_left_point_GLOBAL = _parent.mapToGlobal(self.mapToParent(_dropdown_bottom_left_point_LOCAL))
            return _dropdown_bottom_left_point_GLOBAL

    # region Label
    def _build_label(self):
        _label = base_widgets.Line_Edit()
        return _label

    def setText(self, text):
        self.selected_label.setText(text)

    # region Button

    def _build_button(self):
        _button = buttons.DropdownToggleButton()
        _button.toggleStateChanged.connect(self._emit_dropdown_clicked)
        return _button

    def setDropdownState(self, enabled):
        logger.debug(f'Setting dropdown state to: {enabled}')
        self.dropdown_button.setIconState(enabled)

    @QtCore.Slot()
    def _emit_dropdown_clicked(self, enabled):
        self.dropdownClicked.emit(enabled)



# TODO: Add ability for adding stuff to dropdown layout and get a better window flag behavior for the appearence of the dropdown layout
class Dropdown(DropdownBar):
    currentTextChanged = QtCore.Signal(str)

    def __init__(self):
        super().__init__()
        self.dropdown_items = {}
        self.dropdownClicked.connect(self._dropdown_state_changed)
        self.dropdown_layout = self._build_dropdown_layout()

    @QtCore.Slot()
    def setCurrentItem(self, widget):
        _widget_display_attribute = self.dropdown_items.get(widget)
        _text = _widget_display_attribute()
        print(_text)
        self.setText(_text)
        self.setDropdownState(False)
        self.currentTextChanged.emit(_text)

    def _build_dropdown_layout(self):
        _widget = DropdownLayout()
        _widget.childClicked.connect(self.setCurrentItem)
        _widget.escapeClicked.connect(partial(self.setDropdownState, False))
        return _widget

    @QtCore.Slot()
    def _dropdown_state_changed(self, dropState):
        if dropState is True:
            self.show_dropdown()
        else:
            self.dropdown_layout.hide()

    def show_dropdown(self):
        self.dropdown_layout.show()
        _point = self.bottom_left_global_point()
        self.dropdown_layout.move(_point)

    def addDropdownItem(self, widget, widget_text_callable, *args, **kwargs):
        self.dropdown_layout.addWidget(widget, *args, **kwargs)
        self.dropdown_items[widget] = widget_text_callable

    def addDropdownItems(self, widget, widget_text_callable, *args, **kwargs):
        self.dropdown_layout.addWidget(widget, *args, **kwargs)
        self.dropdown_items[widget] = widget_text_callable

    def setCurrentIndex(self, index):
        _widget = self.dropdown_layout.children()[index]
        print(_widget)
        _widget_data_callable = self.dropdown_items[_widget]
        _text = _widget_data_callable()
        self.setText(_text)


    def clear(self):
        self.setText('')
        self.dropdown_layout.clear_layout()
        self.dropdown_items = {}








if __name__ == "__main__":
    import sys

    _app = QtWidgets.QApplication(sys.argv)

    try:
        _window = Dropdown()

        _label = base_widgets.Label(text='asdasd')
        _label1 = base_widgets.Label(text='dfgd')
        _label2 = base_widgets.Label(text='jhjj')
        _window.addDropdownItem(_label, partial(_label.text))
        _window.addDropdownItem(_label1, partial(_label1.text))
        _window.addDropdownItem(_label2, partial(_label2.text))

        _window.show()
    except Exception as e:
        print(e)

    sys.exit(_app.exec_())
