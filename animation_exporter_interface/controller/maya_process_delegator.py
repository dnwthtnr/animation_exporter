import sys, os, subprocess, time, asyncio
from PySide2 import QtCore

CURRENT_FOLDER = os.path.dirname(__file__)

class MayaProcessDelegator(QtCore.QObject):
    sceneDataWritten = QtCore.Signal()
    itemExported = QtCore.Signal(object)
    itemDataSetsCombined = QtCore.Signal(dict)


    def __init__(self):
        super().__init__()

    def open_file_write_scene_data(self, filepath, output_path):
        """
        Opens the given file and gets the scene data

        Parameters
        ----------
        filepath
        output_path

        Returns
        -------

        """
        _p = subprocess.Popen(
            [
                "python",
                os.path.join(CURRENT_FOLDER, "scene_controller.py"),
                filepath,
                output_path
            ],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            stdin=subprocess.PIPE,
            encoding="utf"
        )
        print('communicated', _p.communicate())
        self.sceneDataWritten.emit()
        return 0

    def export_from_scene(self, item_id, argument_file_path):
        _p = subprocess.Popen(
            [
                "python",
                os.path.join(CURRENT_FOLDER, "export_controller.py"),
                "--i",
                argument_file_path
            ],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            stdin=subprocess.PIPE,
            encoding="utf"
        )
        print(_p.communicate())
        self.itemExported.emit(item_id)
        return 0


    # def export_queue(self, filepath):
    #     _p = subprocess.Popen(
    #         [
    #             "python",
    #             os.path.join(CURRENT_FOLDER, "export_controller.py"),
    #             filepath
    #         ],
    #         stdout=subprocess.PIPE,
    #         stderr=subprocess.PIPE,
    #         stdin=subprocess.PIPE,
    #         encoding="utf"
    #     )
    #     print(_p.communicate())
    #     # self.itemExported.emit(item_id)
    #     return 0


if __name__ == "__main__":
    _processor = MayaProcessDelegator()
    _processor.open_file_write_scene_data(r"Q:\animation_01.ma", r"Q:\__packages\_GitHub\animation_exporter\cache\exportlol.json")


