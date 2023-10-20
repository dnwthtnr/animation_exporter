from . import base_layouts, constants

from PySide2 import QtCore, QtWidgets, QtGui
import os
from functools import partial

# def get_animation_icons(file_name):
#     _path = os.path.join("", constants.animation_local_directory, file_name)
#
#     _icon_list = []
#     for _image in sorted(os.listdir(_path)):
#         _icon = QtGui.QIcon(_path)
#         _icon_list.append(_icon)
#
#     return _icon_list
#
# class LoadingRing(base_widgets.Tool_Button):
#
#     def __init__(self):
#         super().__init__()
#
#     def start_animation(self):
#
#         _icons = get_animation_icons("ring_load")
#
#         _amount = len(_icons)
#         _count = 0
#         while self.isVisible() is True:
#             print(_count)
#             self.setIcon(_icons[_count])
#             _count += 1
#             if _count == _amount:
#                 _count = 0
#             time.sleep(.3)

class MovieDisplay(base_layouts.VerticalLayout):

    def __init__(self, movie):
        super().__init__()
        self._label = QtWidgets.QLabel()

        self._label.setSizePolicy(QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Minimum)
        self._label.setMovie(movie)
        self.addWidget(self._label)
        movie.start()

        # self.resizeMovie()


    def resizeMovie(self):
        _rect = self.geometry()
        _width = _rect.width()
        _height = _rect.height()

        if _width != _height:
            if _width > _height:
                _width = _height
            else:
                _height = _width

        _size = QtCore.QSize(_width, _height)

        self._label.movie().setScaledSize(_size)

    def resizeEvent(self, event):

        self.resizeMovie()

        super().resizeEvent(event)

def get_media(name):
    # _label = QtWidgets.QLabel()
    # _label.setMinimumSize(0, 0)
    # # _label.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Expanding)
    # _movie = _label.movie()

    _mov = QtGui.QMovie(os.path.join(constants.animation_local_directory, f"{name}.gif"))
    # _mov.setScaledSize(QtCore.QSize(50, 50))
    _movie_display = MovieDisplay(_mov)
    _movie_display.setMinimumSize(1, 1)
    return _movie_display


loading_wheel = partial(get_media, 'loads')
loadingSceneData = partial(get_media, 'loadingSceneData')

if __name__ == "__main__":
    import sys

    _app = QtWidgets.QApplication(sys.argv)

    try:
        _window = loading_wheel()
        _window.show()
    except Exception as e:
        print(e)

    sys.exit(_app.exec_())
