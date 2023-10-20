
import os
from PySide2 import QtGui
from . import constants

def get_icon(file_name):
    _path = os.path.join("", constants.icon_local_directory, file_name)
    return QtGui.QIcon(_path)

open_file = get_icon("open_file.svg")
close = get_icon("close.svg")
save = get_icon("save.svg")

down_arrow = get_icon("down_arrow.svg")
up_arrow = get_icon("up_arrow.svg")

checkbox_checked = get_icon("checkbox_checked.svg")
checkbox_unchecked = get_icon("checkbox_unchecked.svg")


start = get_icon("play.svg")
stop = get_icon("stop.svg")
delete = get_icon("delete.svg")
gear = get_icon("gear.svg")
plus = get_icon("plus.svg")
duplicate = get_icon("duplicate.svg")
edit_text = get_icon("edit_text.svg")
logo = get_icon("logo.svg")
