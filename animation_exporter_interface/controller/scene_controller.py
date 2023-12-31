import sys, os

sys.path.append( os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(__file__)))) )


import logging
import os.path

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

from maya import cmds, standalone, utils
from PySide2 import QtCore, QtWidgets
from functools import partial
import json

from animation_exporter.utility_resources import settings, keys
import math_operations


def write_json(path, data):
    with open(path, 'w') as file:
        file.write(json.dumps(data, indent=4, sort_keys=True))



# TODO: communicate to start a process that will write an output file to a place on disk. Just read that instead of
#  running it in the same process. This should fix the whole tool freezing when doing data queries in file

class Scene_Controller(QtCore.QObject):
    SceneContentDataResponse = QtCore.Signal(object)

    ItemDetailsDataResponse = QtCore.Signal(dict)

    def __init__(self):
        standalone.initialize()
        super().__init__()
        self._current_scene_data = {}

    @property
    def current_scene_dict(self):
        return self._current_scene_data

    @QtCore.Slot()
    def open_file(self, filepath, output_filepath):
        logger.info(f'Opening file: {filepath} on a separate thread ')

        try:
            cmds.file(filepath, open=1, force=1)
            logger.info(f'File successfully opened')
            _output_directory = self.write_scene_contents(output_filepath)
            return 0, _output_directory
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to open file {filepath}')
            logger.exception(e)
            return 1, None

    @QtCore.Slot()
    def write_scene_contents(self, output_filepath):
        _top_level_scene_items = self.get_top_level_objects()
        logger.info(f'Emitting SceneContentDataResponse with queried items organized in dictionary')
        _object_data_dict = self.author_scene_hierarchy_dict(objects=_top_level_scene_items)
        self._current_scene_data = _object_data_dict
        logger.debug(f'Dictionary: {_object_data_dict}')

        _output_directory = output_filepath

        write_json(_output_directory, _object_data_dict)
        return _output_directory
        # self.SceneContentDataResponse.emit(_object_data_dict)


    @property
    def current_file(self):
        return cmds.file(query=True, expandName=True)

    ####################################################
    # region static

    def object_has_or_holds_animation(self, object):
        """
        Checks if the given object has animation or holds any animation
        Parameters
        ----------
        object

        Returns
        -------

        """
        if self.current_scene_dict != {}:
            _object_dict = self.current_scene_dict.get(object)
            if _object_dict is not None:
                return _object_dict.get("Has_Or_Holds_Animation")

        if self.is_animated(object):
            return True
        else:
            _object_relatives = cmds.listRelatives(object, allDescendents=True, fullPath=True)
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

    def get_top_level_objects(self):
        """
        Gets all the top level dag objects in the scene

        Returns
        -------

        """
        logger.info(f'Getting scene contests')
        _scene_items = cmds.ls(dagObjects=True)
        _top_level_scene_items = [_item for _item in _scene_items if cmds.listRelatives(_item, allParents=True) == None]
        logger.info(f'Scene contents queried and filtered to top level: {_top_level_scene_items}')
        return _top_level_scene_items

    # endregion
    ####################################################

    def author_scene_hierarchy_dict(self, objects, parent=None, hierarchy_dictionary=None, hierarchy_depth=0):
        """
        Creates a flat dictionary with each scene object and its parent
        Parameters
        ----------
        objects
        parent
        hierarchy_dictionary

        Returns
        -------

        Examples

        {
            "object": {"Parent": None, "Object Name": "object"},
            "nested_object": {"Parent": "object", "Object Name": "nested_object"}
        }

        """
        _hierarchy_dictionary = {} if hierarchy_dictionary is None else hierarchy_dictionary

        for _object in objects:

            _children = cmds.listRelatives(_object, children=True, fullPath=True)

            # _object_data_dictionary = {
            #     "Object Name": _object,
            #     "Parent": parent,
            #     "Children": _children,
            #     "Has_Or_Holds_Animation": self.object_has_or_holds_animation(_object),
            #     # "Type": cmds.objectType(_object),
            #     "Absolute Animation Range": f"{self.get_descendant_animation_range(_object)}"
            # }
            _object_data_dictionary = self.emit_item_details_dictionary(_object)
            if _object_data_dictionary is None:
                _object_data_dictionary = {}
            _object_data_dictionary["Object Name"] = _object
            _object_data_dictionary["Parent"] = parent
            _object_data_dictionary["Children"] = _children
            _hierarchy_dictionary[_object] = _object_data_dictionary

            if _children is not None:
                self.author_scene_hierarchy_dict(
                    objects=_children,
                    parent=_object,
                    hierarchy_dictionary=_hierarchy_dictionary,
                    hierarchy_depth=hierarchy_depth + 1
                )

        return _hierarchy_dictionary

    #############################################

    def get_keyframe_times(self, object):
        """
        Separates the animation times for the given object and its descendants into chunks based on a threshold.
        Threshold determines how many empty frames there should be before separating a piece of animation

        Parameters
        ----------
        object : str
            The scene object name to get the partitions for

        Returns
        -------
        list[ list[ int, int ] ]
            A list holding lists of frame partition ranges

        """
        _descendant_animation_times_list = self.get_descendant_animation_times_list(object)

        _reduced_keyframe_list = math_operations.kill_duplicate_list_elements(_descendant_animation_times_list)

        return _reduced_keyframe_list

    def get_descendant_animation_times_list(self, object):
        """
        Collects all the frames containing animation for the given object and its descendants

        Parameters
        ----------
        object : str
            The object to get the animation of

        Returns
        -------
        list[int] or None
            The animation frames or None if there are none

        """

        _descendants = self.get_descendants(object)

        animation_times_list = []
        if self.is_animated(object) is True:
            _object_animation = self.get_object_animation_times_list(object)
            animation_times_list += _object_animation

        if _descendants is not None:
            for _object in _descendants:
                if self.is_animated(_object) is True:
                    _object_animation = self.get_object_animation_times_list(_object)

                    animation_times_list += _object_animation

        return sorted(animation_times_list)

    def get_export_objects(self, _object):
        logger.debug(f'Attempting to get all export objects for: {_object}')
        _object_export_list = []
        try:
            _object_export_list = self.get_descendants(_object)
            _object_export_list.append(_object)
            logger.debug(f'Successfully got export objects for : {_object}')
            logger.debug(f'Export objects: {_object_export_list}')
        except Exception as e:
            logger.error(f'Encountered exception whil attempting to get export objects for: {_object}. Aborting.')
            logger.exception(e)
            raise e
        return _object_export_list

    def get_descendants(self, _object):
        if self.current_scene_dict != {}:
            _object_dict = self.current_scene_dict.get(object)
            if _object_dict is not None:
                return _object_dict.get("Children")

        return cmds.listRelatives(_object, allDescendents=True, fullPath=True)

    def get_object_animation_times_list(self, object):
        """
        Collects all the frames containing animation for the given object

        Parameters
        ----------
        object : str
            The object to get the animation of

        Returns
        -------
        list[int] or None
            The animation frames or None if there are none

        """
        _animatable_attributes = cmds.listAnimatable(object)

        animation_times_list = []

        for _attribute in _animatable_attributes:
            _attribute_animation_times_list = self.get_attribute_animation_times_list(_attribute)

            animation_times_list += _attribute_animation_times_list

        return sorted(animation_times_list)

    def get_attribute_animation_times_list(self, attribute):
        """
        Collects all the frames containing animation for the given attribute

        Parameters
        ----------
        attribute : str
            The attribute to get the animation of

        Returns
        -------
        list[int] or None
            The animation frames or None if there are none

        """
        _attribute_keyframe_count = cmds.keyframe(attribute, query=True, keyframeCount=True)

        if _attribute_keyframe_count > 0:
            animation_times_list = cmds.keyframe(attribute, query=True, index=(0, _attribute_keyframe_count),
                                                 timeChange=True)

            return animation_times_list

        return []

    ###############################

    def get_descendant_animation_range(self, object):
        """
        Gets the start and end point of an object and its descendants animation

        Parameters
        ----------
        object : str
            Object Name

        Returns
        -------

        """
        _animation_times_list = self.get_descendant_animation_times_list(object)
        if len(_animation_times_list) > 1:
            return [_animation_times_list[0], _animation_times_list[-1]]

    ####################################
    # region Exporting Stuff

    # endregion

    ##########################################

    # region Object stuff

    # @QtCore.Slot()
    # def emit_item_details_on_thread(self, item):
    #     _item_data_dict = self.emit_item_details_dictionary(item)

    def emit_item_details_dictionary(self, object_name):
        # TODO: Start caching this stuf somehow -- lags when requerying stuff

        if self.object_has_or_holds_animation(object_name):
            logger.debug(f'Getting details for object: {object_name}')

            try:
                _animation_times = self.get_keyframe_times(object_name)
                logger.debug(f'_animation_partitions for object: {object_name} :: {_animation_times}')

                _animation_range = self.get_descendant_animation_range(object_name)
                logger.debug(f'_animation_range for object: {object_name} :: {_animation_range}')

                _scene_path = self.current_file
                logger.debug(f'_scene_path for object: {object_name} :: {_scene_path}')

                _item_export_name = f'placeholder_name'
                logger.debug(f'_item_export_name for object: {object_name} :: {_item_export_name}')

                _objects_to_export = self.get_export_objects(object_name)
                logger.debug(f'_objects_to_export for object: {object_name} :: {_objects_to_export}')

                _export_directory = os.path.dirname(self.current_file)
                logger.debug(f'_export_directory for object: {object_name} :: {_export_directory}')

                logger.info(f'Successfully queried item details for : {object_name}')

            except Exception as e:
                logger.error(f'Encountered exception while attempting to query item detail data. Aborting')
                logger.exception(e)
                raise e

            logger.debug(f'Populating detail dictionary for object: {object_name}')
            _item_data_dict = {}
            try:
                _item_data_dict[keys.animation_times] = _animation_times
                _item_data_dict[keys.animation_range_key] = _animation_range
                _item_data_dict[keys.scene_path_key] = _scene_path
                _item_data_dict[keys.item_export_name_key] = _item_export_name
                _item_data_dict[keys.export_objects_key] = _objects_to_export
                _item_data_dict[keys.export_directory_key] = _export_directory
                logger.debug(f'Successfully populated detail dictionary for object: {object_name}')
            except Exception as e:
                logger.error(f'Encountered exception while attempting to populate item data dictionary. Aborting')
                logger.exception(e)
                raise e

            logger.debug(f'Emitting ItemDetailDataResponse with dictionary')
            logger.debug(_item_data_dict)
            # self.ItemDetailsDataResponse.emit(_item_data_dict)

            return _item_data_dict



if __name__ == "__main__":
    scene_controller = Scene_Controller()

    _args = sys.argv
    print('args', _args)

    _filepath = os.path.abspath(_args[-2])
    _output_filepath = os.path.abspath(_args[-1])

    _out = scene_controller.open_file(_filepath, _output_filepath)
    print(_out)
    # input(f'File?')
    # loop = True
    #
    # while loop is True:
    #     sys.stdin.flush()
    #     _input = input("input:")
    #     print(_input)
    #     if _input == "exit":
    #         loop = False
    #         continue
    #
    #     else:
    #         if hasattr(scene_controller, _input):
    #             print(f'hasattr: {_input}')
    #             _string = f"scene_controller.{_input}"
    #             _return = eval(_string)

    # scene_controller.open_file(filepath=)

    # TODO: either make this a command line operatable program or automate 

    # _partial = partial(
    #     subprocess.Popen,
    #     ["python", r"Q:\__packages\_GitHub\mayapy_interface\__init__.py", "arg1", "arg2"],
    #     stdout=sys.stdout
    # )
    # system_allocation.thread.run_on_thread(_partial)
    # # subprocess.Popen(["python", r"Q:\__packages\_GitHub\mayapy_interface\__init__.py", "arg1", "arg2"],stdout=sys.stdout)
