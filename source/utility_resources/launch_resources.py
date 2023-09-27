import json, os

_this_dir = os.path.dirname(__file__)

_path = os.path.join(_this_dir, "defaults", "mayapy_path.json")

with open(_path, "r") as f:
    _data = json.load(f)

INTERPERETER_PATH = _data.get("Path")
