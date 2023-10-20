import logging
import os.path

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
from PySide2 import QtCore
from PySideWrapper import model_view_delegate
from . import scene_controller

from utility_resources import settings, keys, cache
import file_management


class SceneDataController(QtCore.QObject):
    newSceneDataModel = QtCore.Signal(object)
    newScenePath = QtCore.Signal(str)

    writeSceneData = QtCore.Signal(str, str)
    writingSceneData = QtCore.Signal(bool)

    newItemData = QtCore.Signal(dict)

    _model = None

    def __init__(self):
        super().__init__()

    def model(self):
        return self._model

    def setModel(self, model):
        self._model = model

    def sceneSelectionChanged(self, filepath):
        """
        Emits the signal to write the scene data for the given scene filepath

        Parameters
        ----------
        filepath : str
            Scene to be written

        """
        _scene_path_name = file_management.get_file_name_from_path(filepath)
        _output_path_rootname = f"sceneDataCache_({_scene_path_name}).json"
        sceneDataOutputPath = cache.get_unique_file_name(root_name=_output_path_rootname)
        settings.cache_values.set_setting(setting=keys.current_scene_data_file, value=sceneDataOutputPath)

        self.writeSceneData.emit(filepath, sceneDataOutputPath)
        self.writingSceneData.emit(True)

    def readSceneData(self):
        """
        Opens the given filepath and emits the scene path and object data

        Parameters
        ----------
        filepath : str
            Filepath containing data

        """
        _filepath = settings.cache_values.get_setting(keys.current_scene_data_file)

        if not os.path.exists(_filepath):
            logger.warning(f"Scene data file located at: {_filepath} does not exist. Aborting scene data read and returning.")
            return

        _data = file_management.read_json(_filepath)

        scene_path = _data.get(keys.scene_path_key)
        _scene_data = _data.get(keys.object_data)

        _model = model_view_delegate.Selection_Tree_Model(_scene_data)
        self.setModel(_model)

        self.newScenePath.emit(scene_path)
        self.newSceneDataModel.emit(self.model())
        self.writingSceneData.emit(False)

    def itemSelectionChanged(self, items):
        """
        Collect and emit the data

        Parameters
        ----------
        items

        Returns
        -------

        """
        dataSets = []
        print(items)
        try:
            for _item in items:
                _node_for_item = self.model().get_node_for_display_name(_item)
                _data_for_node = _node_for_item.data_dictionary
                dataSets.append(_data_for_node)

            if len(dataSets) == 1:
                self.newItemData.emit(dataSets[0])
                return

            combinedItemData = self.combineDataSets(dataSets=dataSets)
            self.newItemData.emit(combinedItemData)
        except Exception as e:
            logger.warning(e)

    def combineDataSets(self, dataSets):
        combinedData = scene_controller.combineSceneData(dataSets)
        return combinedData
