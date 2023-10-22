
from PySide2 import QtCore, QtWidgets, QtGui
class Main_Window(QtWidgets.QMainWindow):
    close = QtCore.Signal()

    def __init__(self, logger=None, *args, **kwargs):
        """

        Parameters
        ----------
        logger: logging.Logger
        args
        kwargs
        """
        self.logger = logger
        super().__init__(*args, **kwargs)

    def closeEvent(self, event):
        self.close.emit()
        if self.logger:
            self.logger.info(f"'{self.__class__.__name__}' close event triggered.")
        super().closeEvent(event)

class File_Dialogue(QtWidgets.QFileDialog):
    close = QtCore.Signal()

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def closeEvent(self, event):
        self.close.emit()
        super().closeEvent(event)



class Dialog(QtWidgets.QDialog):
    close = QtCore.Signal()

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def closeEvent(self, event):
        self.close.emit()
        super().closeEvent(event)

