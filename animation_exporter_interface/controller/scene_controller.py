
import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)

from maya import standalone
from maya import cmds
from PySide2 import QtCore, QtWidgets


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
            logger.info(f'File successfully opened ')
            self.emit_scene_contents()
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to open file {filepath}')
            logger.exception(e)
            return


    @QtCore.Slot()
    def emit_scene_contents(self):
        logger.info(f'Getting scene contests')
        _scene_items = cmds.ls(dagObjects=True)
        logger.info(f'Scene contents queried: {_scene_items}')
        _object_data_dict = self.gather_content_data_dictionary(_scene_items)
        logger.info(f'Emitting SceneContentDataResponse with queried items organized in dictionary')
        logger.debug(f'Dictionary: {_object_data_dict}')
        self.SceneContentDataResponse.emit(_object_data_dict)

    def gather_content_data_dictionary(self, objects):
        """
        Organizes a dictionary for the given objects and returns it
        Parameters
        ----------
        objects

        Returns
        -------

        """
        _content_data = {}
        for _object_name in objects:
            if self.object_has_or_holds_animation(_object_name) is True:
                _object_data = {}
                _object_data["Object Name"] = _object_name
                _object_data["Object Type"] = cmds.objectType(_object_name)

                _animation_dictionary = self.get_object_animation_dictionary(_object_name)

                _object_data["Animation Range"] = _animation_dictionary["Animation Range"]
                _content_data[_object_name] = _object_data

        return _content_data

    def object_has_or_holds_animation(self, object):
        """
        Checks if the given object has animation or holds any animation
        Parameters
        ----------
        object

        Returns
        -------

        """
        if self.is_animated(object):
            return True
        else:
            _object_relatives = cmds.listRelatives(object, allDescendents=True)
            if _object_relatives is not None:
                for _object in _object_relatives:
                    if self.is_animated(_object) is True:
                        return True
        return False

    def is_animated(self, object):
        """
        Checks if the given object has animation on it
        Parameters
        ----------
        object

        Returns
        -------

        """
        _animatable_attributes = cmds.listAnimatable(object)
        if _animatable_attributes is not None:
            for _attribute in _animatable_attributes:
                _attribute_keyframe_count = cmds.keyframe(_attribute, query=True, keyframeCount=True)
                if _attribute_keyframe_count > 0:
                    return True

        return False

    def get_object_animation_dictionary(self, object):
        """
        Animation dictionary for an object
        Parameters
        ----------
        object

        Returns
        -------

        """

        _object_animation_range_min = 0
        _object_animation_range_max = 0

        _animatable_attributes = cmds.listAnimatable(object)
        _object_animation_dict = {}
        _object_attribute_animation_dict = {}
        for _attribute in _animatable_attributes:
            _attribute_animation_dict = self.get_attribute_animation_dictionary(_attribute)
            if _attribute_animation_dict is not None:
                _object_attribute_animation_dict[_attribute] = _attribute_animation_dict

                _animation_frames = _attribute_animation_dict["Attribute Animation Times"]
                _attribute_animation_range_max = _animation_frames[-1]
                _attribute_animation_range_min = _animation_frames[0]
                if _attribute_animation_range_min < _object_animation_range_min:
                    _object_animation_range_min = _attribute_animation_range_min
                if _attribute_animation_range_max > _object_animation_range_max:
                    _object_animation_range_max = _attribute_animation_range_max

                _object_animation_dict[object] = {"Object Name": object, "Object Animation": _object_attribute_animation_dict}

        _object_animation_dict["Animation Range"] = f"{_object_animation_range_min} - {_object_animation_range_max}"
        return _object_animation_dict

    def get_attribute_animation_dictionary(self, attribute):
        """
        Animation dictionary for a single attribute
        Parameters
        ----------
        attribute

        Returns
        -------

        """
        _attribute_animation_dict = {}
        _attribute_keyframe_count = cmds.keyframe(attribute, query=True, keyframeCount=True)

        if _attribute_keyframe_count > 0:
            # attribute has animation
            _keyframe_times_list = cmds.keyframe(attribute, query=True, index=(0, _attribute_keyframe_count), timeChange=True)
            _keyframe_values_list = cmds.keyframe(attribute, query=True, index=(0, _attribute_keyframe_count), valueChange=True)

            _attribute_animation_dict= {
                "Attribute Name": attribute,
                "Attribute Animation Times": _keyframe_times_list,
                "Attribute Animation Values": _keyframe_values_list
            }

            return _attribute_animation_dict

        return None
