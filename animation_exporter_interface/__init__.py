import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

from animation_exporter.animation_exporter_interface import(
    controller,
    view,
    test
)
