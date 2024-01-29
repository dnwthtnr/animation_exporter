
from PySide2 import QtCore, QtWidgets, QtGui
class Main_Window(QtWidgets.QMainWindow):
    closed = QtCore.Signal()

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
        self.closed.emit()
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
    closed = QtCore.Signal()

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def closeEvent(self, event):
        self.closed.emit()
        super().closeEvent(event)

