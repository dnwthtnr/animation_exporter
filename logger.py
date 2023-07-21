import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


_ui_logger = logging.getLogger("animation_exporter")
_ui_logger.propagate = True

_formatter = logging.Formatter(fmt="%(asctime)s | %(name)s | %(levelname)s -- %(message)s")


_file_handler = logging.FileHandler(
     filename="log_file.txt"
 )
_file_handler.setFormatter(_formatter)
_file_handler.setLevel(logging.INFO)

_ui_logger.addHandler(_file_handler)

