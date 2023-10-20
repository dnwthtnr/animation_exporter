from PySide2 import QtCore

import logging
logger = logging.getLogger(__name__)


class QueueRunner(QtCore.QObject):
    QueueItemRemoved = QtCore.Signal(str)

    def __int__(self, queue):
        super().__init__()

    @QtCore.Slot()
    def start_queue(self, clear_on_completion=False):
        logger.info(f'Starting export queue. Clearing on completion: "{clear_on_completion}"')
        _queue = current_export_queue()
        for _queue_item_id in _queue:
            export_queue_item(_queue_item_id)
            if clear_on_completion is True:
                remove_export_queue_item(_queue_item_id)
                self.QueueItemRemoved.emit(_queue_item_id)
        return 1


if __name__ == "__main__":
    queue_runner = QueueRunner()
