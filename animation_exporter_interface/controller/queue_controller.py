import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

import os

from animation_exporter.utility_resources import settings, keys
from animation_exporter.animation_exporter_interface.controller import export_controller
from PySide2 import QtCore
from functools import partial
from system_allocation import thread
import local_settings_manager
import file_management

default_queue_name = "export_queue"


# region #################queues manager###################


_queue_settings = local_settings_manager.SettingsForModule(module_name="queues")
_default_queue_settings_path = os.path.join(settings.DEFAULTS_FOLDER, "queues.json")
_default_queue_settings = partial(file_management.read_json, _default_queue_settings_path)
if _queue_settings.settings_size() < len(_default_queue_settings()):
    _queue_settings.overwrite_with_dictionary(_default_queue_settings())


def queue_paths():
    return _queue_settings.get_setting("Queues")


def add_queue_path(queue_path, name=None):
    if name is None:
        name = queue_path
    _queue_dict = queue_paths()
    if name not in _queue_dict:
        _queue_dict[name] = queue_path
        _queue_settings.set_setting("Queues", _queue_dict)

        return {
            name: queue_path}
    else:
        logger.warning(f'Queue path already present in queue list')


def remove_queue_path(queue_path):
    _queue_dict = queue_paths()
    if queue_path in _queue_dict:
        del _queue_dict[queue_path]
        _queue_settings.set_setting("Queues", _queue_dict)
    else:
        logger.warning(f'Queue path not present in queue list')


_cache_queue = local_settings_manager.SettingsForModule("default_export_queue")
_default_queue_path = _cache_queue.settings_path()
_default_queue_path_name = "Default"
print(_default_queue_path)
if _default_queue_path not in queue_paths():
    add_queue_path(_default_queue_path, _default_queue_path_name)

def current_queue_path():
    return _queue_settings.get_setting("Current_Queue")


def set_current_queue_path(queue_path_name):
    return _queue_settings.set_setting("Current_Queue", queue_paths().get(queue_path_name))





if len(queue_paths()) == 1:
    print('no')
    set_current_queue_path(_default_queue_path_name)



# region ####################current queue manager###########################




export_queue_json_path = os.path.join(settings.RESOURCES_FOLDER, "export_queue.json")
queues_json_path = os.path.join(settings.RESOURCES_FOLDER, "export_queue.json")

queue_item_identifier_key = "Queue_Item_Identifier"
item_export_name_key = "Export_Name"
scene_path_key = "Scene_Path"
animation_range_key = "Animation_Range"
export_objects_key = "Objects_To_Export"
export_directory_key = "Export_Directory"
animation_partitions_key = "Animation_Partitions"


def current_export_queue():
    return file_management.read_json(current_queue_path())


def current_export_queue_length():
    _queue = current_export_queue()
    return len(_queue)


def get_new_queue_item_identifier():
    """
    Generates a new unique queue item ID
    Returns
    -------

    """
    if current_export_queue_length() > 0:
        _current_indentifiers = [int(_id) for _id in list(current_export_queue().keys())]
        _most_recent_id = max(_current_indentifiers)
        _queue_item_identifier = f"{_most_recent_id + 1}"

        return _queue_item_identifier

    return "0"


@QtCore.Slot()
def add_to_export_queue(scene_path, export_name, scene_objects, animation_range, export_directory):
    _queue_item_identifier = get_new_queue_item_identifier()

    _scene_data_dict = {}
    _scene_data_dict[queue_item_identifier_key] = _queue_item_identifier
    _scene_data_dict[scene_path_key] = scene_path
    _scene_data_dict[item_export_name_key] = export_name
    _scene_data_dict[animation_range_key] = animation_range
    _scene_data_dict[export_objects_key] = scene_objects
    _scene_data_dict[export_directory_key] = export_directory


    settings.add_resource_value(json_path=current_queue_path(), name=_queue_item_identifier, value=_scene_data_dict)
    return _queue_item_identifier


@QtCore.Slot()
def remove_export_queue_item(queue_item_identifier):
    settings.remove_resource_value(json_path=current_queue_path(), name=queue_item_identifier)


def update_queue_item_data(queue_item_identifier, value_key, new_value):
    """
    Updates the value for the given queue ID and rewrites the queue to disk
    Parameters
    ----------
    queue_item_identifier
    value_key
    new_value

    Returns
    -------

    """
    _queue = current_export_queue()

    _queue_item_data = _queue.get(queue_item_identifier)

    if _queue_item_data is None:
        return

    _queue_item_data[value_key] = new_value

    _queue[queue_item_identifier] = _queue_item_data
    file_management.write_json(
        path=current_queue_path(),
        data=_queue
    )


def get_queue_item_data(queue_item_identifier, value_key):
    _queue = current_export_queue()

    _queue_item_data = _queue.get(queue_item_identifier)

    return _queue_item_data.get(value_key)


def clear_export_queue():
    for _queue_id in current_export_queue():
        remove_export_queue_item(_queue_id)




######################################


def export_queue_item(queue_item_identifier):
    logger.info(f'Getting queue item data for ID: {queue_item_identifier}')
    try:
        _export_name = get_queue_item_data(
            queue_item_identifier=queue_item_identifier,
            value_key=keys.item_export_name_key
        )
        _export_directory = get_queue_item_data(
            queue_item_identifier=queue_item_identifier,
            value_key=keys.export_directory_key
        )
        _export_range = get_queue_item_data(
            queue_item_identifier=queue_item_identifier,
            value_key=keys.animation_range_key
        )

        _object = get_queue_item_data(
            queue_item_identifier=queue_item_identifier,
            value_key=keys.export_objects_key
        )
        _scene_path = get_queue_item_data(
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
        _export_partial = partial(
            export_controller.export_animation_range_from_scene,
            scene_path=_scene_path,
            objects=_object,
            start_frame=_export_range[0],
            end_frame=_export_range[1],
            export_path=os.path.join(_export_directory, f"{_export_name}.fbx")
        )
        thread.run_on_thread(_export_partial)
        logger.info(f'Successfully exported queue item ID: {queue_item_identifier}')
    except Exception as e:
        logger.warning(f'Encountered exception while attempting to begin export for for queue item ID: {queue_item_identifier}')
        logger.exception(e)


class QueueRunner(QtCore.QObject):
    QueueItemRemoved = QtCore.Signal(str)

    def __int__(self, queue):
        super().__init__()
    @QtCore.Slot()
    def start_queue(self, clear_on_completion=False):
        logger.info(f'Starting export queue. Clearing on completion: "{clear_on_completion}"')
        _queue = current_export_queue()
        for _queue_item_id in _queue:
            export_queue_item(_queue_item_id)
            if clear_on_completion is True:
                remove_export_queue_item(_queue_item_id)
                self.QueueItemRemoved.emit(_queue_item_id)
        return 1




@QtCore.Slot()
def update_queue_item_export_name(queue_item_identifier, new_name):
    update_queue_item_data(
        queue_item_identifier=queue_item_identifier,
        value_key=keys.item_export_name_key,
        new_value=new_name
    )

@QtCore.Slot()
def update_queue_item_export_directory(queue_item_identifier, new_directory):
    update_queue_item_data(
        queue_item_identifier=queue_item_identifier,
        value_key=keys.export_directory_key,
        new_value=new_directory
    )

@QtCore.Slot()
def update_queue_item_export_frame_range(queue_item_identifier, new_range):
    update_queue_item_data(
        queue_item_identifier=queue_item_identifier,
        value_key=keys.animation_range_key,
        new_value=new_range
    )

if __name__ == "__main__":
    pass
