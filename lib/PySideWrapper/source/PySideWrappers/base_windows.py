
from PySide2 import QtCore, QtWidgets, QtGui

class Main_Window(QtWidgets.QMainWindow):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

class File_Dialogue(QtWidgets.QFileDialog):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)


class Dialog(QtWidgets.QDialog):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

