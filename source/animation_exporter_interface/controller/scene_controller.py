import sys, os

sys.path.append( os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(__file__)))) )


import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

import os.path
from maya import cmds, standalone
import json

from source.utility_resources import keys
from lib import math_operations


def write_json(path, data):
    with open(path, 'w') as file:
        file.write(json.dumps(data, indent=4, sort_keys=True))



# region Query Scene

def get_top_level_objects():
    """
    Gets all the top level dag objects in the scene

    Returns
    -------
    list[str]
        A list of the top level objects in the current scene

    """
    logger.info(f'Getting scene contests')
    _scene_items = cmds.ls(dagObjects=True)
    _top_level_scene_items = [_item for _item in _scene_items if cmds.listRelatives(_item, allParents=True) == None]
    logger.info(f'Scene contents queried and filtered to top level: {_top_level_scene_items}')
    return _top_level_scene_items

def is_animated(object):
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

def object_has_or_holds_animation( object):
    """
    Checks if the given object has animation or holds any animation
    Parameters
    ----------
    object

    Returns
    -------

    """
    if is_animated(object):
        return True
    else:
        _object_relatives = cmds.listRelatives(object, allDescendents=True, fullPath=True)
        if _object_relatives is not None:
            for _object in _object_relatives:
                if is_animated(_object) is True:
                    return True
    return False

def get_descendants(_object):
    return cmds.listRelatives(_object, allDescendents=True, fullPath=True)
# endregion

# region For Animation Times

def get_attribute_animation_times_list(attribute):
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

def get_object_animation_times_list(object):
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
        _attribute_animation_times_list = get_attribute_animation_times_list(_attribute)

        animation_times_list += _attribute_animation_times_list

    return sorted(animation_times_list)

def get_descendant_animation_times_list(object):
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

    _descendants = get_descendants(object)

    animation_times_list = []
    if is_animated(object) is True:
        _object_animation = get_object_animation_times_list(object)
        animation_times_list += _object_animation

    if _descendants is not None:
        for _object in _descendants:
            if is_animated(_object) is True:
                _object_animation = get_object_animation_times_list(_object)

                animation_times_list += _object_animation

    return sorted(animation_times_list)

def get_keyframe_times(object):
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
    if object_has_or_holds_animation(object) is False:
        return None
    _descendant_animation_times_list = get_descendant_animation_times_list(object)

    _reduced_keyframe_list = math_operations.kill_duplicate_list_elements(_descendant_animation_times_list)

    return _reduced_keyframe_list


def get_descendant_animation_range(object):
    """
    Gets the start and end point of an object and its descendants animation

    Parameters
    ----------
    object : str
        Object Name

    Returns
    -------

    """
    _animation_times_list = get_descendant_animation_times_list(object)
    if len(_animation_times_list) > 1:
        return [int(_animation_times_list[0]), int(_animation_times_list[-1])]
#endregion

# region Export Objects
def isExportObjectType(object):
    _type = cmds.objectType(object)
    if _type == "joint":
        return True
    if _type == "transform":
        _immediate_mesh_children = cmds.listRelatives(object, fullPath=True, type='mesh')
        if _immediate_mesh_children is None:
            return False
        if len(_immediate_mesh_children) > 0:
            return True
    return False

def get_export_objects(_object):
    """
    Gets all objects needed to be exported with the given object

    Parameters
    ----------
    _object

    Returns
    -------

    """
    logger.debug(f'Attempting to get all export objects for: {_object}')
    _object_export_list = []
    try:
        _children = get_descendants(_object)
        if isinstance(_children, list):
            _object_export_list = _children

        _object_export_list.append(_object)
        logger.debug(f'Successfully got export objects for : {_object}')
        logger.debug(f'Export objects: {_object_export_list}')
    except Exception as e:
        logger.error(f'Encountered exception whil attempting to get export objects for: {_object}. Aborting.')
        logger.exception(e)
        raise e

    _filtered_list = [_obj for _obj in _object_export_list if isExportObjectType(_obj) is True]

    if len(_filtered_list) == 0:
        _filtered_list = _object_export_list

    return _filtered_list
# endregion

# region Data Structuring
def write_json(path, data):
    with open(path, 'w') as file:
        file.write(json.dumps(data, indent=4, sort_keys=True))


def generate_export_name(object_name, export_object_count):
    export_name = f"{object_name}_OBJ-COUNT({export_object_count})"
    return export_name


def _get_object_data(object_name, object_parent, object_children):
    logger.debug(f'Getting details for object: {object_name}')

    try:
        _animation_times = get_keyframe_times(object_name)
        logger.debug(f'_animation_partitions for object: {object_name} :: {_animation_times}')
    except Exception as e:
        logger.error(f'Encountered exception while attempting to query item animation time data. Aborting')
        logger.exception(e)

    try:
        _animation_range = get_descendant_animation_range(object_name)
        logger.debug(f'_animation_range for object: {object_name} :: {_animation_range}')
    except Exception as e:
        logger.error(f'Encountered exception while attempting to query item animation range. Aborting')
        logger.exception(e)

    try:
        _scene_path = cmds.file(q=True, l=True)[0]
        logger.debug(f'_scene_path for object: {object_name} :: {_scene_path}')
    except Exception as e:
        logger.error(f'Encountered exception while attempting to query scene path. Aborting')
        logger.exception(e)

    try:
        _objects_to_export = get_export_objects(object_name)
        logger.debug(f'_objects_to_export for object: {object_name} :: {_objects_to_export}')
    except Exception as e:
        logger.error(f'Encountered exception while attempting to query export items. Aborting')
        logger.exception(e)

    try:
        _item_export_name = generate_export_name(
            object_name=object_name,
            export_object_count=len(_objects_to_export)
        )
        # _item_export_name = "EXPORTNAME"
        logger.debug(f'_item_export_name for object: {object_name} :: {_item_export_name}')
    except Exception as e:
        logger.error(f'Encountered exception while attempting to query item export name. Aborting')
        logger.exception(e)

    try:
        _export_directory = os.path.dirname(_scene_path)
        logger.debug(f'_export_directory for object: {object_name} :: {_export_directory}')
    except Exception as e:
        logger.error(f'Encountered exception while attempting to query item export directory. Aborting')
        logger.exception(e)

        logger.info(f'Successfully queried item details for : {object_name}')

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
        # raise e

    logger.debug(_item_data_dict)
    _item_data_dict[keys.object_name] = object_name
    _item_data_dict[keys.object_parent] = object_parent
    _item_data_dict[keys.object_children] = object_children

    return _item_data_dict


def _get_all_object_data(objects=None, parent=None, hierarchy_dictionary=None, hierarchy_depth=0):
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
    _objects = get_top_level_objects() if objects is None else objects

    for _object in _objects:

        _children = cmds.listRelatives(_object, children=True, fullPath=True)

        _object_data_dictionary = _get_object_data(
            object_name=_object,
            object_parent=parent,
            object_children=_children,
        )
        if _object_data_dictionary is None:
            _object_data_dictionary = "lol"
        _hierarchy_dictionary[_object] = _object_data_dictionary

        if _children is not None:
            _get_all_object_data(
                objects=_children,
                parent=_object,
                hierarchy_dictionary=_hierarchy_dictionary,
                hierarchy_depth=hierarchy_depth + 1
            )

    return _hierarchy_dictionary


def collect_and_write_scene_data(filepath, output_filepath):
        logger.info(f'Opening file: {filepath} on a separate thread ')
        try:
            cmds.file(filepath, open=1, force=1)
            logger.info(f'File successfully opened')
            # _output_directory = self.write_scene_contents(output_filepath)
            # return 0, _output_directory
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to open file {filepath}')
            logger.exception(e)
            return 1, None

        try:
            _scene_data_dict = {}
            _scene_data_dict[keys.scene_path_key] = filepath
            _scene_data_dict[keys.object_data] = _get_all_object_data()
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to collect scene data')
            logger.exception(e)
            return 1, None

        try:
            write_json(output_filepath, _scene_data_dict)
            return 0
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to write scene data to disk')
            logger.exception(e)
            return 1, None
# endregion

def combineAnimationTimes(animationTimesLists):
    _combinedAnimationTimesList = [_item for _list in animationTimesLists if _list is not None for _item in _list ]
    returnAnimationTimesList = math_operations.kill_duplicate_list_elements(_combinedAnimationTimesList)
    return returnAnimationTimesList


def combineAnimationRanges(animationRanges):
    returnAnimationRange = []
    for _animationRange in animationRanges:
        if _animationRange is None:
            continue
        if returnAnimationRange == []:
            returnAnimationRange = _animationRange
            continue

        _rangeMin = _animationRange[0]
        _rangeMax = _animationRange[-1]

        if _rangeMin < returnAnimationRange[0]:
            returnAnimationRange.pop(0)
            returnAnimationRange.insert(0, _rangeMin)

        if _rangeMax > returnAnimationRange[-1]:
            returnAnimationRange.pop(-1)
            returnAnimationRange.insert(-1, _rangeMax)

    return returnAnimationRange


def combineScenePaths(scenePaths):
    return scenePaths[0]


def combineItemExportNames(exportObjectCount):
    return generate_export_name(object_name="COMPOUNDEXPORT", export_object_count=exportObjectCount)

def combineExportObjects(exportObjectLists):
    _combinedExportObjectList = [_item for _list in exportObjectLists for _item in _list]
    returnExportObjectList = math_operations.kill_duplicate_list_elements(_combinedExportObjectList)
    return returnExportObjectList


def combineExportDirectories(animationTimesLists):
    return animationTimesLists[0]

def combineSceneData(sceneDataList):


    _dataSetAnimationTimes      = [data_set.get(keys.animation_times) for data_set in sceneDataList]
    _dataSetAnimationRange      = [data_set.get(keys.animation_range_key) for data_set in sceneDataList]
    _dataSetScenePath           = [data_set.get(keys.scene_path_key) for data_set in sceneDataList]
    _dataSetItemExportName      = [data_set.get(keys.item_export_name_key) for data_set in sceneDataList]
    _dataSetExportObjects       = [data_set.get(keys.export_objects_key) for data_set in sceneDataList]
    _dataSetExportDirectory     = [data_set.get(keys.export_directory_key) for data_set in sceneDataList]

    _combinedDataSetAnimationTimes  = combineAnimationTimes(        _dataSetAnimationTimes)
    _combinedDataSetAnimationRange  = combineAnimationRanges(       _dataSetAnimationRange)
    _combinedDataSetScenePath       = combineScenePaths(            _dataSetScenePath)
    _combinedDataSetExportObjects   = combineExportObjects(         _dataSetExportObjects)
    _combinedDataSetItemExportName  = combineItemExportNames(       len(_combinedDataSetExportObjects))
    _combinedDataSetExportDirectory = combineExportDirectories(     _dataSetExportDirectory)


    combinedDataSet = {}
    combinedDataSet[keys.animation_times]       = _combinedDataSetAnimationTimes
    combinedDataSet[keys.animation_range_key]   = _combinedDataSetAnimationRange
    combinedDataSet[keys.scene_path_key]        = _combinedDataSetScenePath
    combinedDataSet[keys.item_export_name_key]  = _combinedDataSetItemExportName
    combinedDataSet[keys.export_objects_key]    = _combinedDataSetExportObjects
    combinedDataSet[keys.export_directory_key]  = _combinedDataSetExportDirectory

    return combinedDataSet



if __name__ == "__main__":

    dev = False
    if dev is True:
        _filepath = r"Q:\animation_01.ma"
        _output_filepath = r"Q:\\testfilestuff.json"
    else:
        _args = sys.argv
        _filepath = os.path.abspath(_args[-2])
        _output_filepath = os.path.abspath(_args[-1])


    standalone.initialize()
    _out = collect_and_write_scene_data(_filepath, _output_filepath)
    print(_out)

    # TODO: either make this a command line operatable program or automate


