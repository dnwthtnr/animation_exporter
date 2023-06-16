import json
import os.path


def read_json(path):
    with open(path, 'r'):
        _data = json.load(path)

    return _data


def write_json(path, data):
    with open(path, 'r+'):
        _data = json.load(path)

    return _data


def set_resource_value(json_path, name, value):
    _setting_resource_data = read_json(json_path)

    if name in _setting_resource_data:
        _setting_resource_data[name] = value

        write_json(path=json_path, data=_setting_resource_data)


def get_resource_value(json_path, name):
    _setting_resource_data = read_json(json_path)
    _resource_value = _setting_resource_data.get(name, None)

    return _resource_value


def file_last_modification_date(path):
    if os.path.exists(path):
        return os.path.getmtime(path)


###################################################################

setting_resources_json_path = 'setting_resource_values.json'


def get_setting_resource_value(name):
    return get_resource_value(json_path=setting_resources_json_path, name=name)


def set_setting_resource_value(name, value):
    set_resource_value(json_path=setting_resources_json_path, name=name, value=value)


@property
def settings_last_read_modification_date():
    _date_last_read = get_setting_resource_value("settings.json::Last_Read_Modification_Date")
    return _date_last_read


@setting_resources_json_path.setter
def set_settings_last_read_modification_date(date):
    set_setting_resource_value(
        setting_resource_name="settings.json::Last_Read_Modification_Date",
        setting_resource_value=date
    )


############################################################

animation_parser_resources_json_path = "animation_parser_resource_values.json"


def get_animation_parser_resource_value(name):
    return get_resource_value(json_path=animation_parser_resources_json_path, name=name)


def set_animation_parser_resource_value(name, value):
    set_resource_value(json_path=animation_parser_resources_json_path, name=name, value=value)


@property
def animation_frame_gap_threshold():
    """
    The frame gap defining a separation in animations

    Returns
    -------
    int
        The frame gap

    """
    return get_animation_parser_resource_value("Animation_Frame_Gap_Threshold")


@animation_frame_gap_threshold.setter
def set_animation_frame_gap_threshold(frame_gap):
    """
    Sets the frame gap defining a separation in animations

    Parameters
    ----------
    frame_gap : int
        The frame gap

    """
    set_animation_parser_resource_value("Animation_Frame_Gap_Threshold", frame_gap)
