import file_management
import logging
import multiprocessing
import threading

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
from maya import utils, standalone

from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import (
    base_widgets,
    base_layouts,
    base_windows,
    constants,
    styles
)
from animation_exporter.animation_exporter_interface.view import (
    AnimationExporterFooter,
    AnimationExportQueueView,
    ItemDetailedView,
    AnimationExporterHeader,
    AnimationExporterSceneView
)
from animation_exporter.animation_exporter_interface.controller import (
    queue_controller,
maya_process_delegator,
item_detail_controller
)
from animation_exporter.utility_resources import keys, settings, cache


class PanelController(QtCore.QObject):
    HeaderPanelBuilt = QtCore.Signal(object)
    FooterPanelBuilt = QtCore.Signal(object)
    FocalPanelBuilt = QtCore.Signal(object, object)
    ConstructionFinished = QtCore.Signal()
    CloseButtonClicked = QtCore.Signal()


    # region Local Signals
    QueueDataResponse = QtCore.Signal(object)
    QueuePathsDataResponse = QtCore.Signal(object)
    QueueItemAdded = QtCore.Signal(object, object, object, object, object)
    AddToQueueButtonClicked = QtCore.Signal(str, list)
    # SceneSelected = QtCore.Signal(str)
    SceneDetailPanelBuilt = QtCore.Signal(object)

    writeSceneData = QtCore.Signal(str, str)
    populateSceneDataView = QtCore.Signal(object)
    startQueue = QtCore.Signal()

    # endregion

    @QtCore.Slot()
    def start_construction(self):
        logger.info(f'Beginning construction of panels')
        self.build_main_window_header()
        self.build_main_window_footer()
        self.build_scene_view()
        self.build_queue_view()
        logger.info(f'Construction of panels complete')

    def __init__(self, *args, **kwargs):

        super().__init__(*args, **kwargs)
        self.worker_thread = QtCore.QThread()
        self.worker_thread.start()


    # region #######################| QUEUE STUFF |##########################

    def build_queue_view(self):
        logger.debug(f'Building queue panel and controller')
        try:
            _queue_runner = queue_controller.QueueRunner()
            _queue_runner.moveToThread(self.worker_thread)
            _queue_view = AnimationExportQueueView.QueueItemHolder()
            _queue_view._controller = _queue_runner
            logger.info(f'Queue panel successfully built')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to build queue view. Aborting')
            logger.exception(e)
            return

        logger.debug(f'Connecting signals between queue_runner, queue_view and panel_controller')
        try:
            # self.startQueue.connect(_queue_runner.start_queue)
            _queue_runner.QueueItemRemoved.connect(_queue_view.remove_queue_item)

            _queue_view.QueueSelected.connect(self.queue_selected)
            _queue_view.QueueSelectionListDataQuery.connect(self.emit_queue_paths)

            _queue_view.RemoveQueueItem.connect(queue_controller.remove_export_queue_item)
            _queue_view.UpdateQueueItemName.connect(queue_controller.update_queue_item_export_name)
            _queue_view.UpdateQueueItemExportDirectory.connect(queue_controller.update_queue_item_export_directory)
            _queue_view.UpdateQueueItemFrameRange.connect(queue_controller.update_queue_item_export_frame_range)
            _queue_view.StartQueueButtonClicked.connect(queue_controller.start_queue)

            self.QueueItemAdded.connect(_queue_view.add_queue_item)
            self.QueueDataResponse.connect(_queue_view.populate_queue_view)
            self.QueuePathsDataResponse.connect(_queue_view.populate_queues_combobox)
            logger.info(f'Successfully connected queue panel signals')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to connect queue view signals. Aborting')
            logger.exception(e)
            return

        logger.info(f'Attempting to emit queue panel on FocalPanelBuilt signal with widget: {_queue_view}')
        try:
            self.FocalPanelBuilt.emit(_queue_view, "Export Queue")
            logger.info(f'Successfully emitted queue panel on FocalPanelBuilt signal')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to emit queue view on FocalPanelBuilt signal. Aborting')
            logger.exception(e)
            return

        _queue_view.finish_initialization()

    @QtCore.Slot()
    def queue_selected(self, queue_path):
        queue_controller.set_current_queue_path(queue_path)
        self.QueueDataResponse.emit(queue_controller.current_export_queue())

    @QtCore.Slot()
    def emit_queue_paths(self):
        self.QueuePathsDataResponse.emit(queue_controller.queue_paths())

    @QtCore.Slot()
    def emit_add_to_export_queue(self, export_data_dictionary):
        logger.info(f'Caught signal to add item to export queue. Attempting to emit AddToExportQueue')

        scene_path = export_data_dictionary.get(keys.scene_path_key)
        export_name = export_data_dictionary.get(keys.item_export_name_key)
        scene_objects = export_data_dictionary.get(keys.export_objects_key)
        _selected_animation_ranges = export_data_dictionary.get(keys.animation_partitions_key)
        export_directory = export_data_dictionary.get(keys.export_directory_key)

        for animation_range in _selected_animation_ranges:
            _range_export_name = export_name
            if len(_selected_animation_ranges) > 1:
                _range_export_name = export_name + f"[{animation_range[0]}_{animation_range[1]}]"

            logger.debug(f'New export queue item data: {scene_path, _range_export_name, scene_objects, animation_range, export_directory}')
            try:
                _queue_item_identifier = queue_controller.add_to_export_queue(
                    scene_path,
                    _range_export_name,
                    scene_objects,
                    animation_range,
                    export_directory
                )
                logger.info(f'Successfully emitted AddToExportQueue')
            except Exception as e:
                logger.warning(f'Encountered exception while attempting to emit AddToExportQueue with queue item data. Aborting')
                logger.exception(e)
                return

            self.QueueItemAdded.emit(
                _queue_item_identifier,
                _range_export_name,
                scene_path,
                animation_range,
                export_directory
            )
    # endregion


    # region #######################| SCENE STUFF |##########################

    def build_scene_view(self):
        logger.debug(f'Building scene view panel and controller')
        try:
            # multiprocessing.Process(target=)
            _maya_delegator = maya_process_delegator.MayaProcessDelegator()

            _maya_delegator.sceneDataWritten.connect(self.populate_scene_view)

            self.writeSceneData.connect(_maya_delegator.open_file_write_scene_data)

            _maya_delegator.moveToThread(self.worker_thread)

            _scene_view = AnimationExporterSceneView.ExporterSceneView()
            _scene_view._controller = _maya_delegator
            logger.info(f'Scene panel successfully built')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to build scene view. Aborting')
            logger.exception(e)
            return


        _scene_detail_view = self.build_empty_detail_panel()

        _scene_view_splitter = base_layouts.Splitter()
        _scene_view_splitter.setStyleSheet(styles.maya_splitter)
        _scene_view_splitter.addWidget(_scene_view)
        _scene_view_splitter.addWidget(_scene_detail_view)
        _scene_view_splitter.setSizes([450, 300])


        logger.debug(f'Connecting signals between _scene_view, _scene_controller and panel_controller')
        try:

            _scene_view.ItemSelected.connect(self.generate_scene_detail_panel)
            _scene_view.SceneSelected.connect(self.get_scene_data)

            self.populateSceneDataView.connect(_scene_view.populate_item_view)
            # _scene_controller.ItemDetailsDataResponse.connect(self.generate_scene_detail_panel)

            self.SceneDetailPanelBuilt.connect(_scene_detail_view.clearAndAddWidget)
            logger.info(f'Successfully connected scene view signals')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to connect scene view signals. Aborting')
            logger.exception(e)
            return

        try:
            _scene_view.finish_initialization()
        except Exception as e:
            logger.exception(e)


        logger.info(f'Emitting FocalPanelBuilt with widget: {_scene_view}')
        try:
            _scene_view.show()
            self.FocalPanelBuilt.emit(_scene_view_splitter, "Scene View")
        except Exception as e:
            logger.warning(f'Ecountered exception when attempting to emit FocalPanelBuilt with scene view')
            logger.exception(e)

    @QtCore.Slot()
    def get_scene_data(self, scene):
        _scene_data_filepath = cache.get_unique_file_name(root_name="current_scene_data.json")
        settings.cache_values.set_setting(setting=keys.current_scene_data_file, value=_scene_data_filepath)
        self.writeSceneData.emit(scene, _scene_data_filepath)
        return

    @QtCore.Slot()
    def populate_scene_view(self):
        _scene_data_filepath = settings.cache_values.get_setting(keys.current_scene_data_file)
        _data = file_management.read_json(_scene_data_filepath)

        self.populateSceneDataView.emit(_data)
        return

    def build_empty_detail_panel(self):
        _empty = base_widgets.Label("No Details Yet")
        _widget = base_layouts.VerticalLayout()
        _widget.addWidget(_empty, alignment=constants.align_center)
        _widget.setStyleSheet(styles.maya_detail_view)
        return _widget

    @QtCore.Slot()
    def generate_scene_detail_panel(self, item_detail_dictionary):
        logger.info(f'Signal caught to build scene detail view for dict: {item_detail_dictionary}')

        _item_detail_controller = item_detail_controller.ItemDetailController(
            item_detail_dictionary=item_detail_dictionary
        )
        _item_view = ItemDetailedView.ItemDetailedView()

        _item_detail_controller.dataResponse.connect(_item_view.populate_detail_view)
        _item_detail_controller.addToQueue.connect(self.emit_add_to_export_queue)
        from functools import partial

        _item_view.dataRequest.connect(_item_detail_controller.emit_data_response)
        _item_view.valueChanged.connect(_item_detail_controller.update_value)
        _item_view.AddToQueueButtonClicked.connect(partial(_item_detail_controller.emit_queue_data))
        _item_view.AddToQueueButtonClicked.connect(partial(print, "yes"))

        _item_view.finish_initialization()

        self.SceneDetailPanelBuilt.emit(_item_view)
    # endregion


    # region #######################| HEADER STUFF |##########################


    def build_main_window_header(self):
        """
        Builds the header

        Returns
        -------

        """
        logger.info(f'Building main window header')
        try:
            _widget = AnimationExporterHeader.ExporterHeader()
            # _widget.SceneSelected.connect(self.SceneSelected.emit)
            logger.info(f'Successfully built header and connected signals')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to build header and connewct signal. Aborting')
            logger.exception(e)
            return

        logger.info(f'Emitting HeaderPanelBuilt with widget: {_widget}')
        self.HeaderPanelBuilt.emit(_widget)
    # endregion


    # region #######################| FOOTER STUFF |##########################


    def build_main_window_footer(self):
        """
        Builds the footer
        Returns
        -------

        """
        logger.info(f'Building main window footer')
        try:
            _widget = AnimationExporterFooter.ExporterFooter(margins=4)
            _widget.CloseButtonClicked.connect(self.CloseButtonClicked.emit)
            logger.info(f'Successfully built footer and connected signals')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to build footer and connect signal. Aborting')
            logger.exception(e)
            return

        logger.info(f'Emitting HeaderPanelBuilt with widget: {_widget}')
        self.FooterPanelBuilt.emit(_widget)
    # endregion


if __name__ == "__main__":
    PanelController()
    pass

