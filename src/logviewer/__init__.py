import sys, os
_parentDir = os.path.dirname(__file__)
if _parentDir not in sys.path:
    sys.path.append(_parentDir)

import logcontroller, logview
from PySide2 import QtWidgets

def main():

    log_directory = r"C:\Users\Tanner - Work\Documents\maya"
    import sys
    app = QtWidgets.QApplication(sys.argv)
    _v = logview.LogViewer()
    _c = logcontroller.LogFileBroker(log_directory)
    _c.logHierarchyGenerated.connect(_v.update_hierarchy_view)
    _c.logDataRead.connect(_v.update_log_view)

    _v.fileSelectionChanged.connect(_c.read_log_file)

    _v.show()
    _c.finish_initialization()

    sys.exit(app.exec_())


import ctypes, sys


def is_admin():
    try:
        return ctypes.windll.shell32.IsUserAnAdmin()
    except:
        return False


if is_admin():
    main()
else:
    # Re-run the program with admin rights
    ctypes.windll.shell32.ShellExecuteW(None, "runas", sys.executable, __file__, None, 1)
