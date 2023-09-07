import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
import os.path
from maya import cmds, standalone, utils
from PySide2 import QtCore, QtWidgets
from functools import partial
import json

from animation_exporter.utility_resources import settings, keys
import math_operations

