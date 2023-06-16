
import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)

from maya import standalone
import maya.cmds as cmds
from PySide2 import QtCore

class Scene_Controller(QtCore.QObject):
    SceneContentDataResponse = QtCore.Signal(object)

    def __init__(self):
        standalone.initialize()
        super().__init__()


    @QtCore.Slot()
    def open_file(self, filepath):
        logger.info(f'Opening file: {filepath}')
        try:
            cmds.file(filepath, open=True, force=True)
            logger.info(f'File successfully opened')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to open file {filepath}')
            logger.exception(e)
            return
        else:

            self.emit_scene_contents()

    @QtCore.Slot()
    def emit_scene_contents(self):
        _scene_items = cmds.ls(dagObjects=True)
        print(_scene_items)
        _object_data_dict = self.gather_content_data_dictionary(_scene_items)
        self.SceneContentDataResponse.emit(_object_data_dict)

    def gather_content_data_dictionary(self, objects):
        _content_data = {}
        for _object in objects:
            _content_data[_object] = cmds.objectType(_object)

        return _content_data
