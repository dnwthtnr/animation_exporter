import constants, base_layouts, base_widgets, base_windows, icons
from PySide2 import QtCore, QtWidgets, QtGui
from functools import partial
import os
import copy


import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)

class LargeListDisplay(base_widgets.TextEdit):
    list_ending_seperator = " |"
    list_beginning_seperator = "| "
    item_seperator = " :: "

    def __init__(self, _list=[], *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.setList(_list)

    def list(self):
        _string = self.toPlainText()[len(self.list_beginning_seperator) : -( len(self.list_ending_seperator) )]
        _list = _string.split(self.item_seperator)
        _list.pop(-1)
        return _list

    def setList(self, _list, *args, **kwargs):
        if not isinstance(_list, list) or len(_list) < 1:
            return
        _list_string = ""
        for i, _item in enumerate(_list):
            if i != len(_list):
                _list_string += f"{_item}" + self.item_seperator
            else:
                _list_string += f"{_item}"

        _full_string = self.list_beginning_seperator + _list_string + self.list_ending_seperator

        self.setText(_full_string)


if __name__ == "__main__":
    import sys

    _app = QtWidgets.QApplication(sys.argv)

    _window = LargeListDisplay(_list=['a', 'big', 12, 'list'])
    _window.show()

    print(_window.list())

    sys.exit(_app.exec_())
