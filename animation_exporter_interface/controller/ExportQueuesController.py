from animation_exporter.utility_resources import keys, settings, cache
import file_management, os


def _create_queue_index_file(directory):
    _file_path = file_management.generate_unique_file_name(directory=directory, root_name="ExportQueuesIndex")
    file_management.write_json(data={}, path=_file_path)
    return _file_path

class ExportQueuesInterfaceController(object):

    def __init__(self, export_queue_index_file=None, export_queue_index_save_directory=None):
        super().__init__()
        if export_queue_index_file is not None:
            _result = self._load_from_queue_index_file(export_queue_index_file)
            if _result != -1: return

        if export_queue_index_save_directory is None:
            raise AttributeError(f'If an existing "export_queue_index_file" is not provided a "export_queue_index_save_directory" is required')
        if os.path.exists(export_queue_index_save_directory):
            raise NotADirectoryError(f'The given export_queue_index_save_directory: {export_queue_index_save_directory} does not exist')

        self._create_queue_index_file(directory=export_queue_index_save_directory)



