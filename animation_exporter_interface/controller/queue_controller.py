import logging
import pathlib

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
import os, subprocess, shutil
from animation_exporter.utility_resources import settings, keys, cache
from animation_exporter.animation_exporter_interface.controller import maya_process_delegator
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


def isValidQueue(queue_filepath):
    try:
        _data = file_management.read_json(queue_filepath)
        return True
    except Exception as e:
        return False



def queue_paths():
    return _queue_settings.get_setting("Queues")


def add_queue_path(queue_path, name=None):
    """
    Adds a new queue filepath
    Parameters
    ----------
    queue_path
    name

    Returns
    -------

    """
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
if _default_queue_path not in queue_paths():
    add_queue_path(_default_queue_path, _default_queue_path_name)


def current_queue_path():
    """
    The current export queue. Performs some error checks

    Returns
    -------
    str
        The current export queue path

    """
    _queue = _queue_settings.get_setting("Current_Queue")
    if isValidQueue(_queue) is False:
        logger.warning(f"queue file: {_queue} is invalid or has encountered an error. renaming and creating new")

        if not os.path.exists(_queue):
            remove_queue_path(_queue)
            return

        _new_queue_path = file_management.add_suffix_to_filepath(_queue, "__BROKEN")

        _empty_queue = {}
        file_management.write_json(_queue, _empty_queue)

        return
    return _queue_settings.get_setting("Current_Queue")


def set_current_queue_path(queue_path_name):
    _queue_path = queue_paths().get(queue_path_name)
    if isValidQueue(_queue_path) is False:
        logger.warning(f"queue file: {_queue_path} is invalid or has encountered an error. renaming and creating new")
        return -1
    return _queue_settings.set_setting("Current_Queue", queue_paths().get(queue_path_name))


def duplicate_current_queue(new_queue_path):
    shutil.copy(current_queue_path(), new_queue_path)
    _path = pathlib.Path(new_queue_path)
    add_queue_path(new_queue_path, str(_path.stem))
    return


if len(queue_paths()) == 1:
    set_current_queue_path(_default_queue_path_name)



# region ####################current queue manager###########################


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

    print('yeah')

    _scene_data_dict = {}
    _scene_data_dict[keys.queue_item_identifier_key] = _queue_item_identifier
    _scene_data_dict[keys.scene_path_key] = scene_path
    _scene_data_dict[keys.item_export_name_key] = export_name
    _scene_data_dict[keys.animation_range_key] = animation_range
    _scene_data_dict[keys.export_objects_key] = scene_objects
    _scene_data_dict[keys.export_directory_key] = export_directory


    settings.add_resource_value(json_path=current_queue_path(), name=_queue_item_identifier, value=_scene_data_dict)
    return _queue_item_identifier


@QtCore.Slot()
def remove_export_queue_item(queue_item_identifier):
    settings.remove_resource_value(json_path=current_queue_path(), name=queue_item_identifier)


def clear_export_queue():
    for _queue_id in current_export_queue():
        remove_export_queue_item(_queue_id)


###################################

def get_queue_item_data(queue, queue_item_identifier, value_key):
    _queue_item_data = queue.get(queue_item_identifier)

    return _queue_item_data.get(value_key)


def get_queue_item_export_args(queue, queue_item_identifier):
    print('item stuff')
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

        _export_path = os.path.join(_export_directory, f"{_export_name}.fbx")
        print('more', _scene_path, _export_range, _export_path)
        logger.info(f'Successfully queried data for queue item {queue_item_identifier}:{_export_name}')
        return [_scene_path, _object, _export_range, _export_path]
        # logger.debug(f'\n\nQueue item ID: {queue_item_identifier}\nexport name: {_export_name}, export directory: {_export_directory}, export range: {_export_range}, scene_path: {_scene_path}, objects: {_object}')
    except Exception as e:
        logger.warning(f'Encountered exception while attempting to get data for queue item ID: {queue_item_identifier}')
        logger.exception(e)


class QueueRunner(QtCore.QObject):
    QueueItemRemoved = QtCore.Signal(str)
    itemStarted = QtCore.Signal(object)
    itemFinished = QtCore.Signal(object)

    def __int__(self):
        super().__init__()
        self.export_argument_filepaths = {}


    @QtCore.Slot()
    def start_queue(self):
        _maya_delegator = maya_process_delegator.MayaProcessDelegator()
        _maya_delegator.itemExported.connect(self.queue_item_exported)

        self.export_argument_filepaths = {}

        logger.info(f'Starting export queue')

        _queue = current_export_queue()

        for _queue_item_id in _queue:

            _args = get_queue_item_export_args(queue=_queue, queue_item_identifier=_queue_item_id)
            logger.info(f'Generating temp file to hold export arguments for queue item: {_queue_item_id}')
            try:
                _export_args_file = cache.get_unique_file_name("_export_args.json")

                logger.info(f'Successfully generated export argument temp file. "{_export_args_file}"')
            except Exception as e:
                logger.warning(f'Hit exception while attempting to get temp export arg file.')
                logger.exception(e)
                raise e


            logger.debug(f'Writing export arguments to disk')
            try:
                file_management.write_json(_export_args_file, _args)

                logger.info(f'Successfully wrote export argument temp file')
            except Exception as e:
                logger.warning(f'Hit exception while attempting to save temp export arg file.')
                logger.exception(e)
                raise e

            # TODO: it's getting hung up here -- parallelize these actions

            self.export_argument_filepaths[_queue_item_id] = _export_args_file


            logger.info(f'Sending export item and path to maya delegator')
            self.itemStarted.emit(_queue_item_id)
            _maya_delegator.export_from_scene(_queue_item_id, _export_args_file)

        return 0

    @QtCore.Slot()
    def queue_item_exported(self, queue_item_id):
        logger.info(f'Slot: "queue_item_exporter" triggered')
        logger.info(f'Queue item ID: {queue_item_id} passed to slot')

        logger.info(f'Emitting signal: "itemFinished" with queue ID')
        self.itemFinished.emit(queue_item_id)

        self.delete_temp_argument_file(queue_item_id)
        # _maya_delegator.itemExported.connect(queue_item_id)


    def delete_temp_argument_file(self, queue_item_id):
        print(self.export_argument_filepaths)
        _filepath = self.export_argument_filepaths.get(queue_item_id)

        if _filepath is not None:
            os.remove(_filepath)
            logger.info(f'Deleted file: {_filepath}')

            del self.export_argument_filepaths[queue_item_id]


# region ####################### FUNCTIONS TO EDIT EXPORT QUEUE ITEMS ################################

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
# endregion

if __name__ == "__main__":
    pass
