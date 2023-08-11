from PySide2 import QtCore
from animation_exporter.utility_resources import settings, keys
import math_operations


class ItemDetailController(QtCore.QObject):
    dataResponse = QtCore.Signal(dict)
    addToQueue = QtCore.Signal(dict)

    def __init__(self, item_detail_dictionary):
        """


        Parameters
        ----------
        item_detail_dictionary
        """
        super().__init__()
        _data = {}
        _data[keys.animation_partitions_key] = self.animation_partitions(item_detail_dictionary.get(keys.animation_times, [0, 0]))
        _data[keys.export_directory_key] = item_detail_dictionary.get(keys.export_directory_key)
        _data[keys.export_objects_key] = item_detail_dictionary.get(keys.export_objects_key)
        _data[keys.scene_path_key] = item_detail_dictionary.get(keys.scene_path_key)
        _data[keys.item_export_name_key] = item_detail_dictionary.get(keys.item_export_name_key)

        _data[keys.animation_times] = item_detail_dictionary.get(keys.animation_times)
        _data[keys.animation_range_key] = item_detail_dictionary.get(keys.animation_range_key)
        self.item_detail_dictionary = _data


    def animation_partitions(self, animation_times):
        if not isinstance(animation_times, list):
            return animation_times

        return [
            [
                animation_times[0],
                animation_times[-1]
            ]
        ]

    @QtCore.Slot()
    def update_value(self, name, value):
        """
        Updates a value within the item detail dictionary
        Parameters
        ----------
        name
        value

        Returns
        -------

        """
        self.item_detail_dictionary[name] = value

    @QtCore.Slot()
    def emit_data_response(self):
        """
        Emits the detail dictionary on the dataResponse signal

        """
        self.dataResponse.emit(self.item_detail_dictionary)

    @QtCore.Slot()
    def emit_queue_data(self, *args):
        """
        Emits the detail dictionary on the addToQueue signal

        Parameters
        ----------
        args

        """
        self.addToQueue.emit(self.item_detail_dictionary)





