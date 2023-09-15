import os

import file_management
from animation_exporter.utility_resources import settings


def get_unique_file_name(root_name):
    _name, _ext = root_name.split('.')
    _path = os.path.join(settings.CACHE_FOLDER, root_name)
    iteration = 0
    while os.path.exists(_path) is True:
        _path = os.path.join(settings.CACHE_FOLDER, f"{_name}_{iteration}.{_ext}")
        iteration += 1
    return _path

def clearCache():
    for _item in os.listdir(settings.CACHE_FOLDER):
        _path = os.path.join(settings.CACHE_FOLDER, _item)
        os.remove(_path)

def cacheSize():
    size = 0
    for path, dirs, files in os.walk(settings.CACHE_FOLDER):
        for f in files:
            fp = os.path.join(path, f)
            size += os.path.getsize(fp)
    return size
