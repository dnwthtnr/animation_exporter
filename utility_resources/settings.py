import json
import os.path

CURRENT_FOLDER = os.path.dirname(__file__)

def read_json(path):
    with open(path, 'r') as file:
        _data = json.load(file)

    return _data


def write_json(path, data):
    with open(path, 'w') as file:
        file.write(json.dumps(data, indent=4, sort_keys=True, ))



def set_resource_value(json_path, name, value):
    _setting_resource_data = read_json(json_path)

    if name in _setting_resource_data:
        _setting_resource_data[name] = value

        write_json(path=json_path, data=_setting_resource_data)


def add_resource_value(json_path, name, value):
    _setting_resource_data = read_json(json_path)

    _setting_resource_data[name] = value

    write_json(path=json_path, data=_setting_resource_data)

def remove_resource_value(json_path, name):
    _setting_resource_data = read_json(json_path)

    if name in _setting_resource_data:
        _setting_resource_data.pop(name)

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
        name="settings.json::Last_Read_Modification_Date",
        value=date
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

queue_item_identifier_key = "Queue_Item_Identifier"
item_export_name_key = "Export_Name"
scene_path_key = "Scene_Path"
animation_range_key = "Animation_Range"
export_objects_key = "Objects_To_Export"
export_directory_key = "Export_Directory"
animation_partitions_key = "Animation_Partitions"


def get_export_queue():
    return read_json(export_queue_json_path)

def get_export_queue_length():
    _queue = get_export_queue()
    return len(_queue)

def get_new_queue_item_identifier():
    """
    Generates a new unique queue item ID
    Returns
    -------

    """
    if get_export_queue_length() > 0:
        _current_indentifiers = [int(_id) for _id in list(get_export_queue().keys())]
        _most_recent_id = max(_current_indentifiers)
        _queue_item_identifier = f"{_most_recent_id + 1}"

        return _queue_item_identifier

    return "0"


def add_to_export_queue(scene_path, export_name, scene_objects, animation_range, export_directory):
    _queue_item_identifier = get_new_queue_item_identifier()

    _scene_data_dict = {}
    _scene_data_dict[   queue_item_identifier_key       ] = _queue_item_identifier
    _scene_data_dict[   scene_path_key] = scene_path
    _scene_data_dict[   item_export_name_key] = export_name
    _scene_data_dict[   animation_range_key] = animation_range
    _scene_data_dict[   export_objects_key] = scene_objects
    _scene_data_dict[   export_directory_key] = export_directory

    print('setting')


    add_resource_value(json_path=export_queue_json_path, name=_queue_item_identifier, value=_scene_data_dict)
    return _queue_item_identifier


def remove_export_queue_item(queue_item_identifier):
    remove_resource_value(json_path=export_queue_json_path, name=queue_item_identifier)
    return 1

def update_queue_item_data(queue_item_identifier, value_key, new_value):
    """
    Updates the value for the given queue ID and rewrites the queue to disk
    Parameters
    ----------
    queue_item_identifier
    value_key
    new_value

    Returns
    -------

    """
    print('editing', queue_item_identifier, value_key, new_value)
    _queue = get_export_queue()

    _queue_item_data = _queue.get(queue_item_identifier)
    print(_queue)
    print('i', _queue_item_data)

    if _queue_item_data is None:
        return

    _queue_item_data[value_key] = new_value

    _queue[queue_item_identifier] = _queue_item_data
    print(_queue)
    write_json(
        path=export_queue_json_path,
        data=_queue
    )

def get_queue_item_data(queue_item_identifier, value_key):
    _queue = get_export_queue()

    _queue_item_data = _queue.get(queue_item_identifier)

    return _queue_item_data.get(value_key)
    
def clear_export_queue():
    write_json(path=export_queue_json_path, data={})


#############################################################################


