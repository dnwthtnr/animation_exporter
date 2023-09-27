import base_widgets
from PySide2 import QtWidgets, QtCore



class BoolComboBox(base_widgets.ComboBox):
    valueChanged = QtCore.Signal(bool)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.addItems(['True', 'False'])
        self.currentTextChanged.connect(self.currentSelectionChanged)


    def setValue(self, value):
        if value is False:
            self.setCurrentText('False')
            return
        self.setCurrentText('True')

    def value(self):
        if self.currentText() == "False":
            return False
        return True

    def currentSelectionChanged(self, text):
        self.valueChanged.emit(self.value())
