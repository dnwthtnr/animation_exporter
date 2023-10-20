import os
from PySide2 import QtCore

current_directory = os.path.dirname(__file__)

vertical = QtCore.Qt.Vertical
horizontal = QtCore.Qt.Horizontal

align_right = QtCore.Qt.AlignRight
align_left = QtCore.Qt.AlignLeft
align_top = QtCore.Qt.AlignTop
align_bottom = QtCore.Qt.AlignBottom
align_center = QtCore.Qt.AlignCenter

icon_local_directory = os.path.join(current_directory, "resources", "icons")
stylesheets_local_directory = os.path.join(current_directory, "resources", "stylesheets")
animation_local_directory = os.path.join(current_directory, "resources", "animations")
