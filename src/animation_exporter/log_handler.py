"""
This file contains the setup for the capture of logs.
"""

# Standard Imports
import logging, sys

# Local Imports
from utility_resources import logSettings

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


fileHandler = logging.FileHandler(filename=logSettings.log_filepath())
fileHandler.setFormatter(formatter)
root_logger.addHandler(fileHandler)

root_logger.info("\n")
root_logger.critical(f"########## | NEW SESSION | ##########")
root_logger.info("\n\n")

error_stream_handler = logging.StreamHandler(stream=sys.stderr)
error_stream_handler.setLevel(logging.WARNING)
error_stream_handler.setFormatter(formatter)


informational_log_filter = LevelFilter(min_level=logging.NOTSET, max_level=logging.INFO)
info_stream_handler = logging.StreamHandler(stream=sys.stdout)
info_stream_handler.addFilter(informational_log_filter)
info_stream_handler.setFormatter(formatter)

root_logger.addHandler(error_stream_handler)
root_logger.addHandler(info_stream_handler)

