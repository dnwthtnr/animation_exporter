import json
import os.path

CURRENT_FOLDER = os.path.dirname(__file__)

def read_json(path):
    with open(path, 'r') as file:
        _data = json.load(file)

    return _data


def write_json(path, data):
    with open(path, 'r+') as file:
        _data = json.dump(path, data)

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

setting_resources_json_path = os.path.join(CURRENT_FOLDER, 'setting_resource_values.json')


def get_setting_resource_value(name):
    return get_resource_value(json_path=setting_resources_json_path, name=name)


def set_setting_resource_value(name, value):
    set_resource_value(json_path=setting_resources_json_path, name=name, value=value)


def settings_last_read_modification_date():
    _date_last_read = get_setting_resource_value("settings.json::Last_Read_Modification_Date")
    return _date_last_read


def set_settings_last_read_modification_date(date):
    set_setting_resource_value(
        setting_resource_name="settings.json::Last_Read_Modification_Date",
        setting_resource_value=date
    )


############################################################

animation_parser_resources_json_path = os.path.join(CURRENT_FOLDER, "animation_parser_resource_values.json")


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
    

############################################################

export_queue_json_path = os.path.join(CURRENT_FOLDER, "export_queue.json")


def get_export_queue():
    return read_json(export_queue_json_path)


def add_to_export_queue(scene_path, scene_objects, export_directory):
    _scene_data_dict = {}
    _scene_data_dict["Scene_Path"] = scene_path
    _scene_data_dict["Objects_To_Export"] = scene_objects
    _scene_data_dict["Export_Directory"] = export_directory
    
    set_resource_value(json_path=export_queue_json_path, name=scene_path, value=_scene_data_dict)
    
def clear_export_queue():
    write_json(path=export_queue_json_path, data={})
