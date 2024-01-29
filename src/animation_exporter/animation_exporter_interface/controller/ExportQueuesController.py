import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

import shutil, os
from utility_resources import cache
from utility_resources import keys
from . import maya_process_delegator
import file_management, local_settings_manager
from PySide2 import QtCore

_queue_settings = local_settings_manager.SettingsForModule(module_name="current_export_queue")

def _create_queue_index_file(directory):
    _file_path = file_management.generate_unique_file_name(directory=directory, root_name="ExportQueuesIndex") + '.json'
    file_management.write_json(data={}, path=_file_path)
    return _file_path

def generate_new_queue_index_id(queue_index_data):
    if len(queue_index_data) == 0:
        return "0"

    _queue_index_keys = list(queue_index_data.keys())
    _queue_index_key_ints = [int(_key) for _key in _queue_index_keys]
    _last_index = sorted(_queue_index_key_ints)[-1]

    _new_int_index = _last_index + 1

    return f"{_new_int_index}"

def change_queue_index_key(queue_index_data, oldIndex, newIndex):
    """
    Changes the index key of the given old index to the given new index

    Parameters
    ----------
    queue_index_data : dict
        Queue index data to perform operation within
    oldIndex : str
        The existing index value to change
    newIndex : str
        The new index value to change to

    Returns
    -------
    dict
        The queue index data after the operation is completed

    """
    _indexed_queue_data = queue_index_data.get(oldIndex)
    # print(queue_index_data)
    # print(_indexed_queue_data)
    del queue_index_data[oldIndex]
    _indexed_queue_data[keys.queue_index_key] = newIndex
    return queue_index_data

def reorder_queue_indices(queue_index_data):
    """
    Reorders the index values in the given queue index data.

    Parameters
    ----------
    queue_index_data

    Returns
    -------

    """
    if len(queue_index_data) == 0:
        return queue_index_data

    _queue_index_keys = list(queue_index_data.keys())
    _queue_index_key_ints = [int(_key) for _key in _queue_index_keys]

    _return_queue_index_data = queue_index_data
    for _expected_int_index_key, _int_index_key in enumerate(sorted(_queue_index_key_ints)):

        if _int_index_key == _expected_int_index_key:
            continue

        _return_queue_index_data = change_queue_index_key(
            queue_index_data=_return_queue_index_data,
            oldIndex=str(_int_index_key),
            newIndex=str(_expected_int_index_key)
        )

    return _return_queue_index_data


def make_queue_item_display_dict(item_dictionary):
    _queue_item_index_key           =   item_dictionary.get(keys.queue_item_index_key)
    _queue_item_scene_path          =   item_dictionary.get(keys.scene_path_key)
    _queue_item_export_name         =   item_dictionary.get(keys.item_export_name_key)
    _queue_item_animation_range     =   item_dictionary.get(keys.animation_range_key)
    _queue_item_export_directory    =   item_dictionary.get(keys.export_directory_key)

    queue_item_display_data_dict = {}
    queue_item_display_data_dict[   keys.queue_item_identifier_key] = _queue_item_index_key
    queue_item_display_data_dict[   keys.scene_path_key] = _queue_item_scene_path
    queue_item_display_data_dict[   keys.item_export_name_key] = _queue_item_export_name
    queue_item_display_data_dict[   keys.animation_range_key] = _queue_item_animation_range
    queue_item_display_data_dict[   keys.export_directory_key] = _queue_item_export_directory

    return queue_item_display_data_dict


def get_queue_item_data(queue, queue_item_identifier, value_key):
    _queue_item_data = queue.get(queue_item_identifier)

    return _queue_item_data.get(value_key)

def get_queue_item_export_args(queue, queue_item_identifier):
    # print('item stuff')
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
        # print('more', _scene_path, _export_range, _export_path)
        logger.info(f'Successfully queried data for queue item {queue_item_identifier}:{_export_name}')
        return [_scene_path, _object, _export_range, _export_path]
        # logger.debug(f'\n\nQueue item ID: {queue_item_identifier}\nexport name: {_export_name}, export directory: {_export_directory}, export range: {_export_range}, scene_path: {_scene_path}, objects: {_object}')
    except Exception as e:
        logger.warning(f'Encountered exception while attempting to get data for queue item ID: {queue_item_identifier}')
        logger.exception(e)


class ExportQueuesInterfaceController(QtCore.QObject):
    newQueueAdded = QtCore.Signal(str, str, str)
    queueDeleted = QtCore.Signal(str)

    queueNameChanged = QtCore.Signal(str, str)
    queuePathChanged = QtCore.Signal(str, str)
    queueIndexKeyChanged = QtCore.Signal(str, str)


    newActiveQueueItemAdded = QtCore.Signal(dict)
    activeQueueItemDeleted = QtCore.Signal(str)

    activeQueueItemNameChanged = QtCore.Signal(str, str)
    activeQueueItemExportDirectoryChanged = QtCore.Signal(str, str)
    activeQueueItemIndexKeyChanged = QtCore.Signal(str, str)

    activeExportQueueChanged = QtCore.Signal(str)

    _startExportQueue = QtCore.Signal(dict)
    _stopExportQueue = QtCore.Signal()

    activeExportQueueItemStarted = QtCore.Signal(str)
    activeExportQueueItemFinished = QtCore.Signal(str)

    displayableQueueItemStarted = QtCore.Signal(str)
    displayableQueueItemFinished = QtCore.Signal(str)

    activeExportQueueFinished = QtCore.Signal()

    def finish_initialization(self):
        if self._export_queue_index_file is not None:
            _result = self._load_from_queue_index_file(self._export_queue_index_file)
            # print(_result)
            if _result != -1:
                self.queue_index_file_path = self._export_queue_index_file
                self._emit_queue_index_items()
                return

        if self._export_queue_index_save_directory is None:
            raise AttributeError(f'If an existing "export_queue_index_file" is not provided a "export_queue_index_save_directory" is required')
        if not os.path.exists(self._export_queue_index_save_directory):
            raise NotADirectoryError(f'The given export_queue_index_save_directory: {self._export_queue_index_save_directory} does not exist')

        self.queue_index_file_path = _create_queue_index_file(directory=self._export_queue_index_save_directory)

        self._cached_queue_index_data_state = None

    def __init__(self, export_queue_index_file=None, export_queue_index_save_directory=None):
        self._export_queue_index_file = export_queue_index_file
        self._export_queue_index_save_directory = export_queue_index_save_directory

        self._worker_thread = QtCore.QThread()
        self._worker_thread.start()

        super().__init__()
        self._queue_runner = self._build_queue_runner(thread=self._worker_thread)

    def read_queue_index_data(self):
        return file_management.read_json(self.queue_index_file_path)

    def _build_queue_runner(self, thread):
        _runner = QueueRunner()
        _runner.queueItemStarted.connect(self.activeExportQueueItemStarted.emit)
        _runner.queueItemFinished.connect(self.activeExportQueueItemFinished.emit)

        _runner.queueFinished.connect(self.activeExportQueueFinished.emit)
        self._startExportQueue.connect(_runner.start_export_queue)
        self._stopExportQueue.connect(_runner.stop_export_queue)
        _runner.moveToThread(thread)
        return _runner


    def queueItemFinished(self, item_id):
        self.activeExportQueueItemFinished.emit(item_id)
        return

    def write_queue_index_data(self, queue_index_data):
        self._cached_queue_index_data_state = queue_index_data
        file_management.write_json(path=self.queue_index_file_path, data=queue_index_data)

    # region Methods For Initializing from Pre-existing Queue Index File
    def _load_from_queue_index_file(self, export_queue_index_file):
        try:
            _queue_index_data = file_management.read_json(export_queue_index_file)
        except Exception as e:
            print(e)
            return -1

        # print(export_queue_index_file)

        if not isinstance(_queue_index_data, dict):
            return -1

        if len(_queue_index_data.keys()) == 0:
            return 0

        try:
            _keys = list(_queue_index_data.keys())
            _are_keys_digits = [int(_key) for _key in _keys]
            # print(_are_keys_digits)
        except ValueError as e:
            return -1

        for _key, _value in _queue_index_data.items():
            if not isinstance(_value, dict):
                return -1
            if keys.queue_index_key not in _value:
                return -1
            if keys.queue_name not in _value:
                return -1
            if keys.queue_path not in _value:
                return -1

        return 0

    def _emit_queue_index_items(self):
        """

        Returns
        -------

        """
        for _key, _value in self.read_queue_index_data().items():
            _queue_name = _value.get(keys.queue_name)
            _queue_path = _value.get(keys.queue_path)
            _queue_index_key = _value.get(keys.queue_index_key)
            self.newQueueAdded.emit(_queue_name, _queue_path, _queue_index_key)
    # endregion

    # region Methods for Editing Export Queue Index Files

    def add_queue_to_index(self, queue_name, queue_path):
        logger.info(f'Received signal to add queue to index. {queue_name, queue_path}')
        _queue_index_data = self.read_queue_index_data()

        queue_index_key = generate_new_queue_index_id(_queue_index_data)

        _queue_data = dict()
        _queue_data[keys.queue_index_key] = queue_index_key
        _queue_data[keys.queue_name] = queue_name
        _queue_data[keys.queue_path] = queue_path
        _queue_data[keys.queue_active_state] = False

        _queue_index_data[queue_index_key] = _queue_data

        self.write_queue_index_data(_queue_index_data)

        self.newQueueAdded.emit(queue_name, queue_path, queue_index_key)

    def remove_queue_from_index(self, queue_index_key):
        print('called@')
        """
        Deletes the queue distinguished by the given key and reorders the existing queue index keys

        Parameters
        ----------
        queue_index_key : str
            The queue index key to distinguish the necessary queue to remove

        """
        logger.info(f'Received signal to remove queue to index. {queue_index_key}')


        _queue_index_data = self.read_queue_index_data()

        if queue_index_key not in _queue_index_data:
            raise IndexError(f'Queue index key: {queue_index_key} does not exist.')

        print(queue_index_key, _queue_index_data[queue_index_key])

        del _queue_index_data[queue_index_key]
        self.write_queue_index_data(_queue_index_data)
        self.queueDeleted.emit(queue_index_key)
        print(_queue_index_data)

        # self.reorder_queue_indices()

    def duplicate_queue(self, queue_index_key):
        _queue_index_data = self.read_queue_index_data()

        _queue_data = _queue_index_data.get(queue_index_key)
        _queue_path = _queue_data.get(keys.queue_path)
        _queue_name = _queue_path.get(keys.queue_name)

        new_path = file_management.get_filepath_with_suffix(filepath=_queue_path, suffix="_DUPLICATE")

        if queue_index_key not in _queue_index_data:
            raise IndexError(f'Queue index key: {queue_index_key} does not exist.')
        if os.path.exists(new_path):
            raise FileExistsError()

        shutil.copy2(_queue_path, new_path)

        self.add_queue_to_index(queue_name=f"{_queue_name}_DUPLICATE", queue_path=new_path)


    def change_queue_name(self, queue_index_key, new_name):
        _queue_index_data = self.read_queue_index_data()

        if queue_index_key not in _queue_index_data:
            raise IndexError(f'Queue index key: {queue_index_key} does not exist.')


        _queue_index_data [queue_index_key] [keys.queue_name] = new_name

        self.write_queue_index_data(_queue_index_data)

        self.queueNameChanged.emit(queue_index_key, new_name)

    def change_queue_path(self, queue_index_key, new_path):
        _queue_index_data = self.read_queue_index_data()

        if queue_index_key not in _queue_index_data:
            raise IndexError(f'Queue index key: {queue_index_key} does not exist.')


        _queue_index_data [queue_index_key] [keys.queue_path] = new_path

        self.write_queue_index_data(_queue_index_data)

        self.queuePathChanged.emit(queue_index_key, new_path)

    def change_queue_index_position(self, queue_index_key, new_queue_index_key):
        _queue_index_data = self.read_queue_index_data()

        if queue_index_key not in _queue_index_data:
            raise IndexError(f'Queue index key: {queue_index_key} does not exist.')

        _queue_index_data = change_queue_index_key(
            queue_index_data=_queue_index_data,
            oldIndex=queue_index_key,
            newIndex=new_queue_index_key
        )

        self.write_queue_index_data(_queue_index_data)

        if queue_index_key == _queue_settings.get_setting(keys.active_export_queue):
            _queue_settings.set_setting(keys.active_export_queue, new_queue_index_key)

        self.queueIndexKeyChanged.emit(queue_index_key, new_queue_index_key)

    def reorder_queue_indices(self):
        """
        Reorders the index values in the given queue index data.

        Parameters
        ----------
        queue_index_data

        Returns
        -------

        """
        # TODO: FIX ME -- Keep writing an empty dict
        queue_index_data = self.read_queue_index_data()
        if len(queue_index_data) == 0:
            return

        _queue_index_keys = list(queue_index_data.keys())
        _queue_index_key_ints = [int(_key) for _key in _queue_index_keys]

        _return_queue_index_data = queue_index_data
        for _expected_int_index_key, _int_index_key in enumerate(sorted(_queue_index_key_ints)):

            if _int_index_key == _expected_int_index_key:
                continue

            _return_queue_index_data = change_queue_index_key(
                queue_index_data=_return_queue_index_data,
                oldIndex=str(_int_index_key),
                newIndex=str(_expected_int_index_key)
            )

            # print(_int_index_key, _expected_int_index_key)

            self.queueIndexKeyChanged.emit(
                str(_int_index_key),
                str(_expected_int_index_key)
            )

        self.write_queue_index_data(_return_queue_index_data)
    # endregion

    # region Active Export Queue
    # TODO: Figure out a better way of statelessly keeping track of and managing changes to the active queue when other
    #  queue attributes are changed
    def _load_active_export_queue_from_settings(self):
        _active_queue_value = _queue_settings.get_setting(keys.active_export_queue)

    def set_active_export_queue(self, queue_index_key):
        """
        Sets the given queue index key as the active queue

        Parameters
        ----------
        queue_index_key

        Returns
        -------

        """
        _queue_index_data = self.read_queue_index_data()
        if queue_index_key not in _queue_index_data:
            raise IndexError(f'Queue index key: {queue_index_key} does not exist.')

        for _queue_index_key, _queue_data in _queue_index_data.items():
            _active_state = _queue_data.get(keys.queue_active_state)
            if _active_state is True:
                _queue_index_data[_queue_index_key][keys.queue_active_state] = False

        _queue_index_data[queue_index_key][keys.queue_active_state] = True

        # print('writing', _queue_index_data)

        self.write_queue_index_data(_queue_index_data)

        self.activeExportQueueChanged.emit(_queue_index_data[queue_index_key][keys.queue_path])

    def active_export_queue_path(self):
        _queue_index_data = self.read_queue_index_data()

        _active_queue_index_key = self.active_export_queue_index_key()
        #TODO: this is coming up as none
        if _active_queue_index_key not in _queue_index_data:
            raise IndexError(f'Queue index key: {_active_queue_index_key} does not exist.')

        _active_queue_data_dict = _queue_index_data.get(_active_queue_index_key)
        _active_queue_path = _active_queue_data_dict.get(keys.queue_path)

        return _active_queue_path

    def active_export_queue_index_key(self):
        _queue_index_data = self.read_queue_index_data()
        for _queue_index_key, _queue_data in _queue_index_data.items():
            _active_state = _queue_data.get(keys.queue_active_state)
            if _active_state is True:
                return _queue_index_key

    def read_active_export_queue_data(self):
        _active_queue_path = self.active_export_queue_path()
        _data = file_management.read_json(_active_queue_path)
        return _data

    def write_active_export_queue_data(self, active_queue_data):
        file_management.write_json(path=self.active_export_queue_path(), data=active_queue_data)

    def emit_active_queue_item_data_response(self):
        _active_queue_data = self.read_active_export_queue_data()

        for _queue_item_key, _queue_item_dict in _active_queue_data.items():

            _queue_item_display_dict = make_queue_item_display_dict(_queue_item_dict)

            self.newActiveQueueItemAdded.emit(_queue_item_display_dict)

        return

    # def add_scene_item_data_to

    def add_item_to_active_queue(self, scene_data_dict, *args):
        """
        Constructs and writes the export data dict to the active queue file.
        Separate dict is sent via the newActiveQueueItemAdded signal.

        Parameters
        ----------
        scene_data_dict : dict
            The scene data needing to be added to the export queue

        """

        _active_queue_data = self.read_active_export_queue_data()

        _queue_item_index_key           =   generate_new_queue_index_id(_active_queue_data)
        _queue_item_scene_path          =   scene_data_dict[    keys.scene_path_key]
        _queue_item_export_name         =   scene_data_dict[    keys.item_export_name_key]
        _queue_item_scene_objects       =   scene_data_dict[    keys.animation_range_key]
        _queue_item_animation_range     =   scene_data_dict[    keys.export_objects_key]
        _queue_item_export_directory    =   scene_data_dict[    keys.export_directory_key]


        # Export Data Dictionary -- Written into queue file on disk
        queue_item_export_data_dict = {}
        queue_item_export_data_dict[   keys.queue_item_identifier_key] = _queue_item_index_key
        queue_item_export_data_dict[   keys.scene_path_key] = _queue_item_scene_path
        queue_item_export_data_dict[   keys.item_export_name_key] = _queue_item_export_name
        queue_item_export_data_dict[   keys.animation_range_key] = _queue_item_scene_objects
        queue_item_export_data_dict[   keys.export_objects_key] = _queue_item_animation_range
        queue_item_export_data_dict[   keys.export_directory_key] = _queue_item_export_directory


        # Display Data Dictionary -- Serialized separately to reduce size of data being passed around (i.e. keys.export_objects_key)
        queue_item_display_data_dict = {}
        queue_item_display_data_dict[   keys.queue_item_identifier_key] = _queue_item_index_key
        queue_item_display_data_dict[   keys.scene_path_key] = _queue_item_scene_path
        queue_item_display_data_dict[   keys.item_export_name_key] = _queue_item_export_name
        queue_item_display_data_dict[   keys.export_directory_key] = _queue_item_export_directory

        _active_queue_data[_queue_item_index_key] = queue_item_export_data_dict

        self.write_active_export_queue_data(_active_queue_data)

        self.newActiveQueueItemAdded.emit(queue_item_display_data_dict)

    def remove_item_from_active_queue(self, queue_item_index_key):
        """
        Deletes the queue distinguished by the given key and reorders the existing queue index keys

        Parameters
        ----------
        queue_index_key : str
            The queue index key to distinguish the necessary queue to remove

        """
        logger.info(f'Recieved signal to delete queue item index: {queue_item_index_key}')
        # print(queue_item_index_key, self.read_active_export_queue_data().keys())
        _active_queue_data = self.read_active_export_queue_data()

        if queue_item_index_key not in _active_queue_data:
            raise IndexError(f'Queue index key: {queue_item_index_key} does not exist.')

        del _active_queue_data[queue_item_index_key]

        self.write_active_export_queue_data(_active_queue_data)

        self.activeQueueItemDeleted.emit(queue_item_index_key)

        # self.reorder_active_queue_item_indices()

    def changeExportItemValue(self, exportItemIndex, valueChangeList):
        _active_queue_data = self.read_active_export_queue_data()

        if exportItemIndex not in _active_queue_data:
            raise IndexError(f'Queue index key: {exportItemIndex} does not exist.')

        _attributeName = valueChangeList[0]
        _attributeValue = valueChangeList[1]

        _active_queue_data [exportItemIndex] [_attributeName] = _attributeValue
        self.write_active_export_queue_data(_active_queue_data)


    def change_active_queue_item_name(self, queue_item_index_key, new_name):
        _active_queue_data = self.read_active_export_queue_data()

        if queue_item_index_key not in _active_queue_data:
            raise IndexError(f'Queue index key: {queue_item_index_key} does not exist.')


        _active_queue_data [queue_item_index_key] [keys.queue_item_export_name] = new_name

        self.write_active_export_queue_data(_active_queue_data)

        self.activeQueueItemNameChanged.emit(queue_item_index_key, new_name)

    def change_active_queue_item_index_position(self, queue_item_index_key, new_queue_item_index_key):
        _active_queue_data = self.read_active_export_queue_data()

        if queue_item_index_key not in _active_queue_data:
            raise IndexError(f'Queue index key: {queue_item_index_key} does not exist.')

        _active_queue_data = change_queue_index_key(
            queue_index_data=_active_queue_data,
            oldIndex=queue_item_index_key,
            newIndex=new_queue_item_index_key
        )

        self.write_active_export_queue_data(_active_queue_data)

        if queue_item_index_key == _queue_settings.get_setting(keys.active_export_queue):
            _queue_settings.set_setting(keys.active_export_queue, new_queue_item_index_key)

        self.activeQueueItemIndexKeyChanged.emit(queue_item_index_key, new_queue_item_index_key)

    def reorder_active_queue_item_indices(self):
        """
        Reorders the index values in the given queue index data.

        Parameters
        ----------
        queue_index_data

        Returns
        -------

        """
        active_queue_data = self.read_active_export_queue_data()

        if len(active_queue_data) == 0: pass

        _active_queue_keys              =   list(active_queue_data.keys())
        _active_queue_keys_int          =   [int(_key) for _key in _active_queue_keys]
        _sorted_active_queue_keys_int   =   sorted(_active_queue_keys_int)

        for _expected_key_int, _actual_key_int in enumerate(_sorted_active_queue_keys_int):
            # print(_expected_key_int, _actual_key_int)
            if _expected_key_int == _actual_key_int:
                continue

            expected_queue_item_index_key = str(_expected_key_int)
            queue_item_index_key = str(_actual_key_int)

            active_queue_data = change_queue_index_key(
                queue_index_data=active_queue_data,
                oldIndex=queue_item_index_key,
                newIndex=expected_queue_item_index_key
            )

            self.activeQueueItemIndexKeyChanged.emit(queue_item_index_key, expected_queue_item_index_key)

        # print(active_queue_data)
        self.write_active_export_queue_data(active_queue_data)
    # endregion

    def start_queue(self):
        # print('start')
        active_queue_data = self.read_active_export_queue_data()
        self._startExportQueue.emit(active_queue_data)

    def stop_queue(self):
        print('stop')
        self._stopExportQueue.emit()

class QueueRunner(QtCore.QObject):

    queueItemStarted = QtCore.Signal(str)
    queueItemFinished = QtCore.Signal(str)
    queueFinished = QtCore.Signal()

    def __init__(self):
        super().__init__()
        self._export_argument_tempfiles = {}

    def start_export_queue(self, queue_data):
        _maya_delegator = maya_process_delegator.MayaProcessDelegator()
        _maya_delegator.itemExported.connect(self._queue_item_export_finished)

        logger.info(f'Starting export queue')

        _active_queue_keys              =   list(queue_data.keys())
        _active_queue_keys_int          =   [int(_key) for _key in _active_queue_keys]
        sorted_active_queue_keys_int   =   sorted(_active_queue_keys_int)

        for _queue_item_key_int in sorted_active_queue_keys_int:
            _queue_item_key = str(_queue_item_key_int)

            _export_args = get_queue_item_export_args(queue=queue_data, queue_item_identifier=_queue_item_key)

            ####

            logger.info(f'Generating temp file to hold export arguments for queue item: {_queue_item_key}')
            try:
                _export_args_file = cache.get_unique_file_name("_export_args.json")

                logger.info(f'Successfully generated export argument temp file. "{_export_args_file}"')
            except Exception as e:
                logger.warning(f'Hit exception while attempting to get temp export arg file.')
                logger.exception(e)
                raise e

            #####

            logger.debug(f'Writing export arguments to disk')
            try:
                file_management.write_json(_export_args_file, _export_args)

                logger.info(f'Successfully wrote export argument temp file')
            except Exception as e:
                logger.warning(f'Hit exception while attempting to save temp export arg file.')
                logger.exception(e)
                raise e

            # TODO: it's getting hung up here -- parallelize these actions

            self._export_argument_tempfiles[_queue_item_key] = _export_args_file


            logger.info(f'Sending export item and path to maya delegator')
            self.queueItemStarted.emit(_queue_item_key)
            _maya_delegator.export_from_scene(_queue_item_key, _export_args_file)

    @QtCore.Slot()
    def _queue_item_export_finished(self, queue_item_key):
        logger.info(f'Queue item ID: {queue_item_key} passed to slot')

        logger.info(f'Emitting signal: "itemFinished" with queue ID {queue_item_key}')
        self.queueItemFinished.emit(queue_item_key)

        self._delete_temp_argument_file(queue_item_key)

        if len(self._export_argument_tempfiles) == 0:
            self.queueFinished.emit()


    def _delete_temp_argument_file(self, queue_item_key):
        _filepath = self._export_argument_tempfiles.get(queue_item_key)

        if _filepath is not None:
            os.remove(_filepath)
            logger.info(f'Deleted file: {_filepath}')

            del self._export_argument_tempfiles[queue_item_key]


    def stop_export_queue(self):
        print('stopping export queue')




if __name__ == "__main__":
    _p = ["0", "7", "2", "1", "2276"]
    _1 = [0, 7, 2, 1, 2276]

    print(sorted(_p), sorted(_1))
