
import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)

from maya import standalone
import pymel.core as pm
from maya import cmds
from maya import mel
from PySide2 import QtCore, QtWidgets

from animation_exporter.utility_resources import settings
from animation_exporter.animation_exporter_interface.view import ItemDetailedView



def set_animation_start(frame):
    # mel.eval(f'FBXExportBakeComplexStart -value {frame}' )
    pm.mel.FBXExportBakeComplexStart(value=frame)


def set_animation_end(frame):
    pm.mel.FBXExportBakeComplexEnd(value=frame)
    return


def export_animation(object_name, export_path):
    # cmds.ls(object_name, sl=True)
    cmds.select(object_name)
    pm.mel.FBXExport(filename=export_path, s=True)
    return


def export_animation_range(object_name, start_frame, end_frame, export_path):
    cmds.loadPlugin('fbxmaya')

    set_animation_start(start_frame)
    set_animation_end(end_frame)
    export_animation(object_name, export_path)

class ExportController(QtCore.QObject):


    def __init__(self):
        super().__init__()


    def set_animation_start(self, frame):
        return

    def set_animation_end(self, frame):
        return

    def export_animation(self, path):
        return

import unittest
from animation_exporter.animation_exporter_interface.controller import export_controller

if __name__ == "__main__":
    def tst_scene_01():
        cmds.file(new=True, force=True)

        _cube = "cube"
        cmds.polyCube(name=_cube)

        _childCube = "childcube"

        cmds.polyCube(name=_childCube)

        cmds.parent(_childCube, _cube)

        cmds.file(r'Q:\__packages\_GitHub\testfile.fbx', rename=True)

        cmds.file(save=True, force=True)

    tst_scene_01()

    export_animation_range(object_name="cube", start_frame=0, end_frame=10, export_path=r'Q:\__packages\_GitHub')
