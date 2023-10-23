import sys, os
_parentDir = os.path.dirname(__file__)
if _parentDir not in sys.path:
    sys.path.append(_parentDir)

import logcontroller, logviewer
from PySide2 import QtWidgets

def main():

    log_directory = r"C:\Users\Tanner - Work\Documents\Settings\logs"
    import sys
    app = QtWidgets.QApplication(sys.argv)
    _v = logviewer.LogViewer()
    _c = logcontroller.LogFileBroker(log_directory)
    _c.logHierarchyGenerated.connect(_v.update_hierarchy_view)
    _c.logDataRead.connect(_v.update_log_view)

    _v.fileSelectionChanged.connect(_c.read_log_file)

    _v.show()
    _c.finish_initialization()

    sys.exit(app.exec_())




main()
