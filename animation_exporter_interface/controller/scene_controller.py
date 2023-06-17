
import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.NOTSET)

from maya import standalone
from maya import cmds
from PySide2 import QtCore, QtWidgets

from animation_exporter.utility_resources import settings
from animation_exporter.animation_exporter_interface.view import ItemDetailedView


class Scene_Controller(QtCore.QObject):
    SceneContentDataResponse = QtCore.Signal(object)

    DetailPanelBuilt = QtCore.Signal(object)

    def __init__(self):
        # standalone.initialize()
        cmds.file(new=True, force=True)
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
        _top_level_scene_items = self.get_top_level_objects()
        # _object_data_dict = self.gather_content_data_dictionary(_top_level_scene_items)
        logger.info(f'Emitting SceneContentDataResponse with queried items organized in dictionary')
        _object_data_dict = self.author_scene_hierarchy_dict(objects=_top_level_scene_items)
        logger.debug(f'Dictionary: {_object_data_dict}')
        self.SceneContentDataResponse.emit(_object_data_dict)

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

    #endregion
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

            _children = cmds.listRelatives(_object, children=True)

            _object_data_dictionary = {
                "Object Name": _object,
                "Parent": parent,
                "Children": _children,
                "Type": cmds.objectType(_object),
                "Absolute Animation Range": self.get_descendant_animation_range(_object)
            }
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

    def separate_animation_partitions(self, object):
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

        animation_partitions_list = []

        _current_partition_start_point = _descendant_animation_times_list[0]
        for i, frame in enumerate(_descendant_animation_times_list):
            _previous_frame = _descendant_animation_times_list[i - 1] if i > 0 else frame
            _current_frame = frame

            _partition_frame_cutoff = _previous_frame + settings.animation_frame_gap_threshold()

            if _current_frame >= _partition_frame_cutoff or _current_frame == _descendant_animation_times_list[-1]:
                _partition = [_current_partition_start_point, _previous_frame]
                _current_partition_start_point = _current_frame

                if _current_partition_start_point != _previous_frame:
                    animation_partitions_list.append(_partition)

        return animation_partitions_list

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
        _descendants = cmds.listRelatives(object, allDescendents=True)

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
            animation_times_list = cmds.keyframe(attribute, query=True, index=(0, _attribute_keyframe_count), timeChange=True)

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
            return f"{_animation_times_list[0] } -- {_animation_times_list[-1]}"


    ####################################
    # region Exporting Stuff

    def bake_animation(self, object):
        cmds.bakeSimulation(object, animation='keysOrObjects', hierarchy='below')

    def export(self):
        return

    #endregion

    ##########################################

    #region Object stuff

    def emit_item_panel(self, panel):
        self.DetailPanelBuilt.emit(panel)

    @QtCore.Slot()
    def emit_item_detailed_view(self, item):
        _item_view = ItemDetailedView.DetailedViewPanel()
        if self.object_has_or_holds_animation(item):
            _partitions = self.separate_animation_partitions(item)
            _item_view.addSection("Animation Partitions", f'{_partitions}')

            _item_view.addSection("Object Animation Range", "".join(self.get_descendant_animation_range(item)))
        self.emit_item_panel(_item_view)
        return
