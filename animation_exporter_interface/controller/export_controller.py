import sys, os

import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

from maya import cmds, mel, standalone
from animation_exporter.utility_resources import keys
from PySide2 import QtCore, QtWidgets

from animation_exporter.utility_resources import settings


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
        print(cmds.ls(), objects)
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







def get_queue_item_data(queue, queue_item_identifier, value_key):

    _queue_item_data = queue.get(queue_item_identifier)

    return _queue_item_data.get(value_key)


def export_queue_item(queue, queue_item_identifier):
    logger.info(f'Getting queue item data for ID: {queue_item_identifier}')
    try:
        _export_name = get_queue_item_data(
            queue=queue,
            queue_item_identifier=queue_item_identifier,
            value_key=keys.item_export_name_key
        )
        _export_directory = get_queue_item_data(
            queue=queue,
            queue_item_identifier=queue_item_identifier,
            value_key=keys.export_directory_key
        )
        _export_range = get_queue_item_data(
            queue=queue,
            queue_item_identifier=queue_item_identifier,
            value_key=keys.animation_range_key
        )

        _object = get_queue_item_data(
            queue=queue,
            queue_item_identifier=queue_item_identifier,
            value_key=keys.export_objects_key
        )
        _scene_path = get_queue_item_data(
            queue=queue,
            queue_item_identifier=queue_item_identifier,
            value_key=keys.scene_path_key
        )
        logger.info(f'Successfully queried data for queue item {queue_item_identifier}:{_export_name}')
        logger.debug(f'\n\nQueue item ID: {queue_item_identifier}\nexport name: {_export_name}, export directory: {_export_directory}, export range: {_export_range}, scene_path: {_scene_path}, objects: {_object}')
    except Exception as e:
        logger.warning(f'Encountered exception while attempting to get data for queue item ID: {queue_item_identifier}')
        logger.exception(e)

    logger.info(f'Attempting to export for queue item ID: {queue_item_identifier}')
    try:
        # _maya_delegator.export_from_scene(
        #     item_id=queue_item_identifier,
        #     scene_path=_scene_path,
        #     objects=_object,
        #     frame_range=_export_range,
        #     export_directory=_export_directory,
        #     export_name=_export_name
        # )
        export_animation_range_from_scene(
            scene_path=_scene_path,
            objects=_object,
            start_frame=_export_range[0],
            end_frame=_export_range[1],
            export_path=os.path.join(_export_directory, f"{_export_name}.fbx")
        )
        logger.info(f'Successfully exported queue item ID: {queue_item_identifier}')
        return 0
    except Exception as e:
        logger.warning(f'Encountered exception while attempting to begin export for for queue item ID: {queue_item_identifier}')
        logger.exception(e)
        return 1


@QtCore.Slot()
def start_queue(queue):
    for _queue_item_id in queue:
        _outcome = export_queue_item(queue, _queue_item_id)
        return 1


if __name__ == "__main__":
    _args = sys.argv
    _queue_path = _args[-1]

    standalone.initialize()

    start_queue(_queue_path)

    # _scene_path = _args[-6]
    # _object = _args[-5]
    # _frame_start = float(_args[-4]),
    # _frame_end = float(_args[-3]),
    # _export_directory = _args[-2]
    # _export_name = _args[-1]
    #
    # standalone.initialize()
    #
    # export_animation_range_from_scene(
    #     scene_path=_scene_path,
    #     objects=_object,
    #     start_frame=_frame_start,
    #     end_frame=_frame_end,
    #     export_path=os.path.join(_export_directory, f"{_export_name}.fbx")
    # )

    # def tst_scene_01():
    #     cmds.file(new=True, force=True)
    #
    #     _cube = "cube"
    #     cmds.polyCube(name=_cube)
    #
    #     _childCube = "childcube"
    #
    #     cmds.polyCube(name=_childCube)
    #
    #     cmds.parent(_childCube, _cube)
    #
    #     cmds.file(r'Q:\__packages\_GitHub\testfile.ma', rename=True)
    #
    #     cmds.file(save=True, force=True)
    #
    # tst_scene_01()
    #
    # export_animation_range(objects="cube", start_frame=0, end_frame=10, export_path=r'Q:\__packages\_GitHub\fileexport.fbx')
