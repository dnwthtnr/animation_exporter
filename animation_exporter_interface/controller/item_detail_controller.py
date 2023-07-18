from PySide2 import QtCore
from animation_exporter.utility_resources import settings, keys
import math_operations


class ItemDetailController(QtCore.QObject):
    dataResponse = QtCore.Signal(dict)
    addToQueue = QtCore.Signal(dict)

    def __init__(self, item_detail_dictionary):
        super().__init__()
        _data = {}
        _data[keys.animation_partitions_key] = self.animation_partitions(item_detail_dictionary.get(keys.animation_times, [0, 0]))
        _data[keys.export_directory_key] = item_detail_dictionary.get(keys.export_directory_key)
        _data[keys.export_objects_key] = item_detail_dictionary.get(keys.export_objects_key)
        _data[keys.scene_path_key] = item_detail_dictionary.get(keys.scene_path_key)
        _data[keys.item_export_name_key] = item_detail_dictionary.get(keys.item_export_name_key)
        self.item_detail_dictionary = _data


    def animation_partitions(self, animation_times):
        _animation_times = animation_times

        _partitions = math_operations.apply_sorted_numerical_threshold(
            value_list=_animation_times,
            threshhold=settings.animation_frame_gap_threshold()
        )

        return _partitions

    @QtCore.Slot()
    def update_value(self, name, value):
        self.item_detail_dictionary[name] = value

    @QtCore.Slot()
    def emit_data_response(self):
        self.dataResponse.emit(self.item_detail_dictionary)

    @QtCore.Slot()
    def emit_queue_data(self, *args):
        print('add')
        self.addToQueue.emit(self.item_detail_dictionary)
        return





