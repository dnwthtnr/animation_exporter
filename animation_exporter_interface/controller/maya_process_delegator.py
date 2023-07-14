import sys, os, subprocess
from PySide2 import QtCore


class MayaProcessDelegator(QtCore.QObject):


    def __init__(self):
        super().__init__()
        self.process = subprocess.Popen(["python", "scene_controller.py"], stdout=sys.stdout, stderr=sys.stdout, stdin=subprocess.PIPE, encoding="utf", universal_newlines=True)

    def open_file_get_scene_data(self, filepath):
        # _exit_code, _output = self.process.communicate(f"print('yessss')\n", timeout=10)
        # self.process.stdin.flush()
        self.process.stdin.flush()
        self.process.stdin.write(f"print('yessss')\n")
        self.process.communicate()

        # print('yes', _exit_code, _output)
        # if _exit_code == 0:
        #     print(_output)
        return



if __name__ == "__main__":
    _processor = MayaProcessDelegator()
    _processor.open_file_get_scene_data(r"Q:\animation_01.ma")


