import sys, os, subprocess, time, asyncio
from PySide2 import QtCore

CURRENT_FOLDER = os.path.dirname(__file__)

class MayaProcessDelegator(QtCore.QObject):
    sceneDataWritten = QtCore.Signal()
    itemExported = QtCore.Signal(str)


    def __init__(self):
        super().__init__()

    # def open_file_write_scene_data(self, filepath, output_path):
    #     _rv = self.doit(filepath, output_path)
    #     self.sceneDataWritten.emit()

    def open_file_write_scene_data(self, filepath, output_path):
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
        print(_p.communicate())
        self.sceneDataWritten.emit()
        return 0

    def export_from_scene(self, item_id, scene_path, objects, frame_range, export_directory, export_name):
        _p = subprocess.Popen(
            [
                "python",
                os.path.join(CURRENT_FOLDER, "export_controller.py"),
                scene_path,
                objects,
                f"{frame_range[0]}",
                f"{frame_range[1]}",
                export_directory,
                export_name
            ],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            stdin=subprocess.PIPE,
            encoding="utf"
        )
        print(_p.communicate())
        self.itemExported.emit(item_id)
        return 0


    def export_queue(self, filepath):
        _p = subprocess.Popen(
            [
                "python",
                os.path.join(CURRENT_FOLDER, "export_controller.py"),
                filepath
            ],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            stdin=subprocess.PIPE,
            encoding="utf"
        )
        print(_p.communicate())
        # self.itemExported.emit(item_id)
        return 0


if __name__ == "__main__":
    _processor = MayaProcessDelegator()
    _processor.open_file_write_scene_data(r"Q:\animation_01.ma", r"Q:\__packages\_GitHub\animation_exporter\cache\exportlol.json")


