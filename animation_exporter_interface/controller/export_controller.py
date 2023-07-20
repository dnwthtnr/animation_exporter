import sys, os

import file_management
import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

from maya import cmds, mel, standalone
from animation_exporter.utility_resources import keys

# region: Export Stuff

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
    # logger.debug(f'Exporting objects: {objects}')
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


def export_animation_range_from_scene(scene_path, objects, frame_range, export_path):
    cmds.file(scene_path, open=True, force=True)
    export_animation_range(objects, frame_range[0], frame_range[-1], export_path)

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

        print(_export_name)
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
    print(_args)


    standalone.initialize()
    if _oparg == "--i":
        _export_data = file_management.read_json(_filepath)
        _outcome = export_animation_range_from_scene(*_export_data)
    else:
        # _queue_path = r"C:\Users\Tanner - Work\Documents\Settings\default_export_queue.json"
        _queue_data = file_management.read_json(_filepath)
        export_queue_items(_queue_data)
