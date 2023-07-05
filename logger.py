import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


# print('lolol')
_ui_logger = logging.getLogger("animation_exporter")
_ui_logger.propagate = True
_file_handler = logging.FileHandler(
     filename="log_file.txt"
 )
_file_handler.setLevel(logging.DEBUG)

_ui_logger.addHandler(_file_handler)

