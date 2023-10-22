"""
This file contains the setup for the capture of logs.
"""

# Standard Imports
import logging, sys

# Local Imports
from src.animation_exporter.utility_resources import logSettings

root_logger = logging.getLogger()
root_logger.setLevel(logging.DEBUG)



class LevelFilter(logging.Filter):

    def __init__(self, min_level, max_level):
        """
        Filters out logs that do not fit within the minimum and maximum log levels
        Parameters
        ----------
        min_level : int
            The minimum logging level
        max_level : int
            The maximum logging level
        """
        self.min_level = min_level
        self.max_level = max_level
        super().__init__()

    def filter(self, record):
        _level = record.levelno
        if _level in range(self.min_level, self.max_level):
            return True
        return False


formatter = logging.Formatter(fmt="[%(asctime)s] %(levelname)s (%(module)s : %(lineno)d): %(message)s")


log_filepath = logSettings.log_filepath()


fileHandler = logging.FileHandler(filename=log_filepath)
fileHandler.setFormatter(formatter)
root_logger.addHandler(fileHandler)

logSettings.insert_log_session_seperator(log_filepath)

