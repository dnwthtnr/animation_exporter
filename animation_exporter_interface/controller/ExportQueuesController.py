from animation_exporter.utility_resources import keys, settings, cache
import file_management, os
from PySide2 import QtCore


def _create_queue_index_file(directory):
    _file_path = file_management.generate_unique_file_name(directory=directory, root_name="ExportQueuesIndex")
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
    del _indexed_queue_data[oldIndex]
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

class ExportQueuesInterfaceController(object):
    queueIndexDataChanged = QtCore.Signal(dict)

    def __init__(self, export_queue_index_file=None, export_queue_index_save_directory=None):
        super().__init__()
        if export_queue_index_file is not None:
            _result = self._load_from_queue_index_file(export_queue_index_file)
            if _result != -1: return

        if export_queue_index_save_directory is None:
            raise AttributeError(f'If an existing "export_queue_index_file" is not provided a "export_queue_index_save_directory" is required')
        if os.path.exists(export_queue_index_save_directory):
            raise NotADirectoryError(f'The given export_queue_index_save_directory: {export_queue_index_save_directory} does not exist')

        self.queue_index_file_path = _create_queue_index_file(directory=export_queue_index_save_directory)

        self._cached_queue_index_data_state = None

    def read_queue_index_data(self):
        return file_management.read_json(self.queue_index_file_path)

    def write_queue_index_data(self, queue_index_data):
        self._cached_queue_index_data_state = queue_index_data
        file_management.write_json(path=self.queue_index_file_path, data=queue_index_data)
        self.queueIndexDataChanged.emit(queue_index_data)

    def add_queue_to_index(self, queue_name, queue_path):
        _queue_index_data = self.queue_index_data()

        _queue_index_key = generate_new_queue_index_id(_queue_index_data)

        _queue_data = dict()
        _queue_data[keys.queue_index_key] = _queue_index_key
        _queue_data[keys.queue_name] = queue_name
        _queue_data[keys.queue_path] = queue_path

        _queue_index_data[_queue_index_key] = _queue_data

        self.write_queue_index_data(_queue_index_data)

    def remove_queue_from_index(self, queue_index_key):
        _queue_index_data = self.queue_index_data()

        if queue_index_key not in _queue_index_data:
            raise IndexError(f'Queue index key: {queue_index_key} does not exist.')

        del _queue_index_data[queue_index_key]
        _queue_index_data = reorder_queue_indices(_queue_index_data)

        self.write_queue_index_data(_queue_index_data)

    def change_queue_name(self, queue_index_key, new_name):
        _queue_index_data = self.queue_index_data()

        if queue_index_key not in _queue_index_data:
            raise IndexError(f'Queue index key: {queue_index_key} does not exist.')


        _queue_index_data [queue_index_key] [keys.queue_name] = new_name

        self.write_queue_index_data(_queue_index_data)

    def change_queue_path(self, queue_index_key, new_path):
        _queue_index_data = self.queue_index_data()

        if queue_index_key not in _queue_index_data:
            raise IndexError(f'Queue index key: {queue_index_key} does not exist.')


        _queue_index_data [queue_index_key] [keys.queue_path] = new_path

        self.write_queue_index_data(_queue_index_data)

    def change_queue_index_position(self, old_queue_index_key, new_queue_index_key):
        return






if __name__ == "__main__":
    _p = ["0", "7", "2", "1", "2276"]
    _1 = [0, 7, 2, 1, 2276]

    print(sorted(_p), sorted(_1))
