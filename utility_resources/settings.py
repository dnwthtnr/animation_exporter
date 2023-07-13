import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

import json
import os.path
import local_settings_manager, file_management
from functools import partial

RESOURCES_FOLDER = os.path.dirname(__file__)
DEFAULTS_FOLDER = os.path.join(RESOURCES_FOLDER, "defaults")
# TODO: replace with settings holders


def mayapy_path():
    _dict = file_management.read_json(os.path.join(DEFAULTS_FOLDER, "mayapy_path.json"))
    return _dict.get("Path")


def set_resource_value(json_path, name, value):
    _setting_resource_data = file_management.read_json(json_path)

    if name in _setting_resource_data:
        _setting_resource_data[name] = value

        file_management.write_json(path=json_path, data=_setting_resource_data)


def add_resource_value(json_path, name, value):
    _setting_resource_data = file_management.read_json(json_path)

    _setting_resource_data[name] = value

    file_management.write_json(path=json_path, data=_setting_resource_data)


def remove_resource_value(json_path, name):
    _setting_resource_data = file_management.read_json(json_path)

    if name in _setting_resource_data:
        _setting_resource_data.pop(name)

        file_management.write_json(path=json_path, data=_setting_resource_data)


def get_resource_value(json_path, name):
    _setting_resource_data = file_management.read_json(json_path)
    _resource_value = _setting_resource_data.get(name, None)

    return _resource_value


def file_last_modification_date(path):
    if os.path.exists(path):
        return os.path.getmtime(path)


###################################################################

setting_resources_json_path = os.path.join(RESOURCES_FOLDER, 'setting_resource_values.json')


def get_setting_resource_value(name):
    return get_resource_value(json_path=setting_resources_json_path, name=name)


def set_setting_resource_value(name, value):
    set_resource_value(json_path=setting_resources_json_path, name=name, value=value)


def settings_last_read_modification_date():
    _date_last_read = get_setting_resource_value("settings.json::Last_Read_Modification_Date")
    return _date_last_read


def set_settings_last_read_modification_date(date):
    set_setting_resource_value(
        name="settings.json::Last_Read_Modification_Date",
        value=date
    )


############################################################

animation_parser_resources_json_path = os.path.join(RESOURCES_FOLDER, "animation_parser_resource_values.json")


def get_animation_parser_resource_value(name):
    return get_resource_value(json_path=animation_parser_resources_json_path, name=name)


def set_animation_parser_resource_value(name, value):
    set_resource_value(json_path=animation_parser_resources_json_path, name=name, value=value)


def animation_frame_gap_threshold():
    """
    The frame gap defining a separation in animations

    Returns
    -------
    int
        The frame gap

    """
    return get_animation_parser_resource_value("Animation_Frame_Gap_Threshold")


def set_animation_frame_gap_threshold(frame_gap):
    """
    Sets the frame gap defining a separation in animations

    Parameters
    ----------
    frame_gap : int
        The frame gap

    """
    set_animation_parser_resource_value("Animation_Frame_Gap_Threshold", frame_gap)
