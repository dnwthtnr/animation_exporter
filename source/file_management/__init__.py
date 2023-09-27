import json, os, sys, pathlib


APPDATA = os.path.expanduser(os.path.join("~", "AppData"))

def read_json(path):
    with open(path, 'r') as file:
        _data = json.load(file)

    return _data


def write_json(path, data={}):
    print('writing', data)
    with open(path, 'w') as file:
        file.write(json.dumps(data, indent=4, sort_keys=True))




def get_filepath_with_suffix(filepath, suffix):
    _path = pathlib.Path(filepath)
    _path_dir = _path.parent
    _path_name = _path.stem
    _path_suffix = _path.suffix

    _name = f"{str(_path_name)}{suffix}{_path_suffix}"

    _path = os.path.join(str(_path_dir), _name)

    return _path

def add_suffix_to_filepath(filepath, suffix):

    _path = get_filepath_with_suffix(filepath, suffix)

    if os.path.exists(_path):
        while os.path.exists(_path):
            _path = add_suffix_to_filepath(_path)

    os.renames(filepath, _path)

    return _path


def get_file_name_from_path(filepath):
    _path = pathlib.Path(filepath)
    return _path.stem

def generate_unique_file_name(directory, root_name):
    """
    Given a directory and rootname will generate and return a unique path

    Parameters
    ----------
    directory
    root_name

    Returns
    -------

    """
    _name = os.path.join(directory, root_name)

    _count = 0
    while os.path.exists(_name):
        _file_name = get_file_name_from_path(_name)

        _split_file_name = _file_name.split("_")
        if _split_file_name[-1].isnumeric() and len(_split_file_name) > 1:
            _file_name = "".join(_split_file_name[:-1])

        _name = os.path.join(directory, f"{_file_name}_0{_count}")

    return _name

def create_file(filepath):
    """
    Will create the given file and if necessary populate it with the default data

    Parameters
    ----------
    filepath

    Returns
    -------

    """
    _pathobj = pathlib.Path(filepath)
    _ext = _pathobj.suffix

    print(_ext)

    if _ext in [".json", "json", ".JSON", "JSON"]:
        write_json(filepath)
        return

    os.write("", filepath)



if __name__ == "__main__":
    _p = r"C:\Users\Tanner - Work\Documents\Settings\queues.json"

    print(add_suffix_to_filepath(_p, "suffix"))
