
import sys, os
# sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(__file__)))))
sys.path.append(r"Q:\\__packages\\_GitHub")
sys.path.append(r"Q:\__packages\_GitHub\primary_toolkit\PF\Autodesk\Maya2022\Python37")
sys.path.append(r"Q:\__packages\_GitHub\primary_toolkit\PF\Autodesk\Maya2022\Python37\Lib")
sys.path.append(r"Q:\__packages\_GitHub\primary_toolkit\PF\Autodesk\Maya2022\Python37\Lib\site-packages")
sys.path.append(r"Q:\__packages\_GitHub\primary_toolkit\PF\Autodesk\Maya2022\bin")
sys.path.append(r"Q:\__packages\_GitHub\primary_toolkit\PF\Autodesk\Maya2022\Python37\DLLs")
import file_management
import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

from maya import mel, standalone
import maya.cmds as cmds
from animation_exporter.utility_resources import keys


# region: Export Stuff



def bake_animation_range(export_name, start_frame, end_frame):

    mel.eval("FBXExportBakeComplexAnimation -v true;")

    mel.eval(f"FBXExportBakeComplexStart -v {start_frame};")
    mel.eval(f"FBXExportBakeComplexEnd -v {end_frame};")
    # mel.eval('FBXExportSkeletonDefinitions -v true')
    mel.eval(f'FBXExportSplitAnimationIntoTakes -v "nameexport" {start_frame} {end_frame};')
    mel.eval('FBXExportDeleteOriginalTakeOnSplitAnimation -v true;')

    mel.eval("FBXExportBakeComplexStep -v 1;")


def export_animation(objects, export_path):
    logger.info(f'Attempting to export to: {export_path} -- Set  log level DEBUG to get output displaying objects')
    # logger.debug(f'Exporting objects: {objects}')
    try:
        cmds.select(objects)

        logger.info(f'Successfully exported to: {export_path}')
    except Exception as e:
        logger.warning(f'Encountered exception when attempting to export animation to {export_path}')
        logger.exception(e)


def export_animation_range_from_scene(scene_path, objects, frame_range, export_path):
    cmds.file(scene_path, open=True, force=True)
    cmds.select(objects)
    # sys.path.append(r'C:\Program Files\Autodesk\Maya2022\plug-ins')
    cmds.loadPlugin(r'C:/Program Files/Autodesk/Maya2022/plug-ins/fbx/plug-ins/fbxmaya.mll')

    mel.eval('FBXResetExport;')

    mel.eval("FBXExportBakeComplexAnimation -v true")

    _startframe = frame_range[0]
    _endframe = frame_range[-1]

    mel.eval(f"FBXExportBakeComplexStart -v {_startframe}")
    mel.eval(f"FBXExportBakeComplexEnd -v {_endframe}")
    # mel.eval('FBXExportSkeletonDefinitions -v true')
    mel.eval(f'FBXExportSplitAnimationIntoTakes -v "nameexport" {_startframe} {_endframe}')
    mel.eval('FBXExportDeleteOriginalTakeOnSplitAnimation -v true;')

    mel.eval("FBXExportBakeComplexStep -v 1")

    cmds.file(export_path, exportSelected=True, type="FBX export", force=True, prompt=False)
    #
    #
    # cmds.file(scene_path, open=True, force=True)
    #
    # cmds.loadPlugin('fbxmaya')
    #
    # mel.eval('FBXResetExport;')
    #
    # cmds.select(objects)
    # if isinstance(frame_range, list) and len(frame_range) == 2:
    #     bake_animation_range(export_path, frame_range[0], frame_range[-1])
    #
    #
    #
    # try:
    #     cmds.file(export_path, exportSelected=True, type="FBX export", force=True, prompt=False)
    # except Exception as e:
    #     mel.eval(f'FBXExport -s -file "{export_path}";')
    #
    # mel.eval('FBXExportSplitAnimationIntoTakes -clear;')

# endregion


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
        # logger.debug(f'\n\nQueue item ID: {queue_item_identifier}\nexport name: {_export_name}, export directory: {_export_directory}, export range: {_export_range}, scene_path: {_scene_path}, objects: {_object}')
    except Exception as e:
        logger.warning(f'Encountered exception while attempting to get data for queue item ID: {queue_item_identifier}')
        logger.exception(e)

    logger.info(f'Attempting to export for queue item ID: {queue_item_identifier}')
    try:
        export_animation_range_from_scene(
            scene_path=_scene_path,
            objects=_object,
            frame_range=_export_range,
            export_path=os.path.join(_export_directory, f"{_export_name}.fbx")
        )

        # print(_export_name)
        logger.info(f'Successfully exported queue item ID: {queue_item_identifier}')
        return 0
    except Exception as e:
        logger.warning(
            f'Encountered exception while attempting to begin export for for queue item ID: {queue_item_identifier}')
        logger.exception(e)
        return 1


def export_queue_items(queue):
    # _queue = file_management.read_json(queue)
    for _queue_item_id in queue.keys():
        _outcome = export_queue_item(queue, _queue_item_id)


if __name__ == "__main__":
    _args = sys.argv
    _oparg = _args[1]
    _filepath = _args[-1]
    # print(_args)


    standalone.initialize()
    if _oparg == "--i":
        _export_data = file_management.read_json(_filepath)
        _outcome = export_animation_range_from_scene(*_export_data)
    else:
        # _queue_path = r"C:\Users\Tanner - Work\Documents\Settings\default_export_queue.json"
        _queue_data = file_management.read_json(_filepath)
        export_queue_items(_queue_data)
