import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

import os

from animation_exporter.utility_resources import settings
from animation_exporter.animation_exporter_interface.controller import export_controller
from PySide2 import QtCore


def export_queue_item(queue_item_identifier):
    logger.info(f'Getting queue item data for ID: {queue_item_identifier}')
    try:
        _export_name = settings.get_queue_item_data(
            queue_item_identifier=queue_item_identifier,
            value_key=settings.item_export_name_key
        )
        _export_directory = settings.get_queue_item_data(
            queue_item_identifier=queue_item_identifier,
            value_key=settings.export_directory_key
        )
        _export_range = settings.get_queue_item_data(
            queue_item_identifier=queue_item_identifier,
            value_key=settings.animation_range_key
        )

        _object = settings.get_queue_item_data(
            queue_item_identifier=queue_item_identifier,
            value_key=settings.export_objects_key
        )
        _scene_path = settings.get_queue_item_data(
            queue_item_identifier=queue_item_identifier,
            value_key=settings.scene_path_key
        )
        logger.info(f'Successfully queried data for queue item {queue_item_identifier}')
        logger.debug(f'\n\nQueue item ID: {queue_item_identifier}\nexport name: {_export_name}, export directory: {_export_directory}, export range: {_export_range}, scene_path: {_scene_path}, objects: {_object}')
    except Exception as e:
        logger.warning(f'Encountered exception while attempting to get data for queue item ID: {queue_item_identifier}')
        logger.exception(e)

    logger.info(f'Attempting to export for queue item ID: {queue_item_identifier}')
    try:
        export_controller.export_animation_range_from_scene(
            scene_path=_scene_path,
            objects=_object,
            start_frame=_export_range[0],
            end_frame=_export_range[1],
            export_path=os.path.join(_export_directory, f"{_export_name}.fbx")
        )
        logger.info(f'Successfully exported queue item ID: {queue_item_identifier}')
    except Exception as e:
        logger.warning(f'Encountered exception while attempting to begin export for for queue item ID: {queue_item_identifier}')
        logger.exception(e)


class QueueRunner(QtCore.QObject):
    RemoveQueueItem = QtCore.Signal(str)

    def __int__(self):
        super().__init__()
    @QtCore.Slot()
    def start_queue(self, clear_on_completion=False):
        logger.infop(f'Starting export queue. Clearing on completion: "{clear_on_completion}"')
        _queue = settings.get_export_queue()
        for _queue_item_id in _queue:
            export_queue_item(_queue_item_id)
            if clear_on_completion is True:
                settings.remove_export_queue_item(_queue_item_id)
                self.RemoveQueueItem.emit(_queue_item_id)
        return 1


@QtCore.Slot()
def remove_queue_item(queue_item_identifier):
    settings.remove_export_queue_item(queue_item_identifier)


@QtCore.Slot()
def add_queue_item(scene_path, export_name, scene_objects, animation_range, export_directory):
    settings.add_to_export_queue(
        scene_path=scene_path,
        export_name=export_name,
        scene_objects=scene_objects,
        animation_range=animation_range,
        export_directory=export_directory
    )


@QtCore.Slot()
def update_queue_item_export_name(queue_item_identifier, new_name):
    settings.update_queue_item_data(
        queue_item_identifier=queue_item_identifier,
        value_key=settings.item_export_name_key,
        new_value=new_name
    )

@QtCore.Slot()
def update_queue_item_export_directory(queue_item_identifier, new_directory):
    settings.update_queue_item_data(
        queue_item_identifier=queue_item_identifier,
        value_key=settings.export_directory_key,
        new_value=new_directory
    )

@QtCore.Slot()
def update_queue_item_export_frame_range(queue_item_identifier, new_range):
    settings.update_queue_item_data(
        queue_item_identifier=queue_item_identifier,
        value_key=settings.animation_range_key,
        new_value=new_range
    )

if __name__ == "__main__":
    pass
