
import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)

from maya import cmds, standalone, mel
from PySide2 import QtCore, QtWidgets

from animation_exporter.utility_resources import settings

standalone.initialize()


def set_animation_start(frame):
    logger.info(f'Attempting to set animation bake start to {frame}')
    try:
        mel.eval(f"FBXExportBakeComplexStart -v {frame}")
        logger.info(f'Successfully set animation bake start time')
    except Exception as e:
        logger.warning(f'Encountered exception when attempting to set animation bake start')
        logger.exception(e)


def set_animation_end(frame):
    logger.info(f'Attempting to set animation bake end to {frame}')
    try:
        mel.eval(f"FBXExportBakeComplexEnd -v {frame}")
        logger.info(f'Successfully set animation bake end time')
    except Exception as e:
        logger.warning(f'Encountered exception when attempting to set animation bake end')
        logger.exception(e)

def bake_animation_range(start_frame, end_frame):
    mel.eval("FBXExportBakeComplexAnimation -v true")
    set_animation_start(start_frame)
    set_animation_end(end_frame)
    mel.eval("FBXExportBakeComplexStep -v 1")



def export_animation(objects, export_path):
    logger.info(f'Attempting to export to: {export_path} -- Set  log level DEBUG to get output displaying objects')
    logger.debug(f'Exporting objects: {objects}')
    try:
        cmds.select(objects)
        cmds.file(export_path, exportSelected=True, type="FBX export", force=True, prompt=False)


        logger.info(f'Successfully exported to: {export_path}')
    except Exception as e:
        logger.warning(f'Encountered exception when attempting to export animation to {export_path}')
        logger.exception(e)


def export_animation_range(objects, start_frame, end_frame, export_path):
    cmds.loadPlugin('fbxmaya')
    bake_animation_range(start_frame, end_frame)
    export_animation(objects, export_path)


def export_animation_range_from_scene(scene_path, objects, start_frame, end_frame, export_path):
    cmds.file(scene_path, open=True, force=True)
    export_animation_range(objects, start_frame, end_frame, export_path)

if __name__ == "__main__":
    def tst_scene_01():
        cmds.file(new=True, force=True)

        _cube = "cube"
        cmds.polyCube(name=_cube)

        _childCube = "childcube"

        cmds.polyCube(name=_childCube)

        cmds.parent(_childCube, _cube)

        cmds.file(r'Q:\__packages\_GitHub\testfile.ma', rename=True)

        cmds.file(save=True, force=True)

    tst_scene_01()

    export_animation_range(objects="cube", start_frame=0, end_frame=10, export_path=r'Q:\__packages\_GitHub\fileexport.fbx')
