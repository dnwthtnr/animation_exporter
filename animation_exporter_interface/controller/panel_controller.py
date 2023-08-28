from functools import partial

import file_management
import logging
import multiprocessing
import os.path
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
    # AnimationExportQueueView,
    QueueEditor,
    ItemDetailedView,
    AnimationExporterHeader,
    AnimationExporterSceneView
)
from animation_exporter.animation_exporter_interface.controller import (
ExportQueuesController,
    # queue_controller,
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
    addToActiveQueue = QtCore.Signal(dict)
    # SceneSelected = QtCore.Signal(str)
    SceneDetailPanelBuilt = QtCore.Signal(object)

    writeSceneData = QtCore.Signal(str, str)
    populateSceneDataView = QtCore.Signal(str, dict)
    startQueue = QtCore.Signal()

    # endregion

    @QtCore.Slot()
    def start_construction(self):
        logger.info(f'Beginning construction of panels')
        self._build_header_panel()
        self._build_footer_panel()
        self._initialize_scene_view_components()
        self.build_queue_view()
        self.populate_scene_view_from_cached_scene_data()
        logger.info(f'Construction of panels complete')

    def __init__(self, margins, *args, **kwargs):

        super().__init__(*args, **kwargs)
        self.margins = margins

        self.worker_thread = QtCore.QThread()
        self.worker_thread.start()

        self._maya_delegator = maya_process_delegator.MayaProcessDelegator()
        self._maya_delegator.moveToThread(self.worker_thread)

        self.writeSceneData.connect(self._maya_delegator.open_file_write_scene_data)

        self._maya_delegator.sceneDataWritten.connect(self.populate_scene_view_from_cached_scene_data)


    # region #######################| QUEUE STUFF |##########################

    def build_queue_view(self):
        logger.debug(f'Building queue panel and controller')
        try:
            # _queue_runner = queue_controller.QueueRunner()
            # _queue_runner.moveToThread(self.worker_thread)
            try:
                queue_controller = ExportQueuesController.ExportQueuesInterfaceController(export_queue_index_file=r'C:\Users\Tanner - Work\Documents\Settings\ExportQueuesIndex.json')
                # queue_controller.moveToThread(self.worker_thread)
                queue_view = QueueEditor.QueueEditor()
                queue_view.controller = queue_controller
            except Exception as e:
                raise e
            # queue_view._controller = _queue_runner
            logger.info(f'Queue panel successfully built')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to build queue view. Aborting')
            logger.exception(e)
            return

        logger.debug(f'Connecting signals between queue_runner, queue_view and panel_controller')
        try:
            # self.startQueue.connect(_queue_runner.start_queue)

            # _queue_runner.QueueItemRemoved.connect(queue_view.remove_queue_item)

            # TODO: separate this out. Have runner emit signal that item has started to signal to queue view to start
            #  the loading instead of it doing it itself
            # _queue_runner.itemFinished.connect(queue_view.queueItemCompleted)
            # _queue_runner.itemStarted.connect(queue_view.queueItemStarted)

            # self._queue_view.QueueSelected.connect(self.queue_selected)
            # self._queue_view.QueueSelectionListDataQuery.connect(self.emit_queue_paths)
            #
            # self._queue_view.RemoveQueueItem.connect(queue_controller.remove_export_queue_item)
            # self._queue_view.UpdateQueueItemName.connect(queue_controller.update_queue_item_export_name)
            # self._queue_view.UpdateQueueItemExportDirectory.connect(queue_controller.update_queue_item_export_directory)
            # self._queue_view.UpdateQueueItemFrameRange.connect(queue_controller.update_queue_item_export_frame_range)
            # self._queue_view.StartQueueButtonClicked.connect(_queue_runner.start_queue)
            #
            # self._queue_view.saveCurrentQueue.connect(self.save_current_queue)

            # TODO: Rework queue runner and way of hooking up to queue view to manage export states

            # region Queues Hookup
            queue_view        .requestingExistingQueueIndex   .connect(   queue_controller      .finish_initialization          )
            queue_view        .addNewQueue                    .connect(   queue_controller.add_queue_to_index             )
            queue_view        .duplicateQueue                 .connect(   queue_controller      .duplicate_queue                )
            queue_view        .deleteQueue                    .connect(   queue_controller      .remove_queue_from_index        )
            queue_view        .changeQueueName                .connect(   queue_controller      .change_queue_name              )
            queue_view        .changeQueueDirectory           .connect(   queue_controller      .change_queue_path              )
            queue_view        .changeQueueIndex               .connect(   queue_controller      .change_queue_index_position    )

            queue_view        .changeActiveQueue              .connect(   queue_controller      .set_active_export_queue        )
            queue_view        .requestingActiveQueueItems     .connect(   queue_controller      .emit_active_queue_item_data_response        )

            # region Active Queue Hookup
            queue_view        .deleteActiveQueueItem                    .connect(   queue_controller      .remove_item_from_active_queue                )
            queue_view        .changeActiveQueueItemName                .connect(   queue_controller      .change_active_queue_item_name                )
            queue_view        .changeActiveQueueItemExportDirectory     .connect(   queue_controller      .change_active_queue_item_export_directory    )
            queue_view        .changeActiveQueueItemIndex               .connect(   queue_controller      .change_active_queue_item_index_position      )

            queue_view.startActiveQueue.connect(queue_controller.start_queue)
            queue_view.stopActiveQueue.connect(queue_controller.stop_queue)


            queue_controller  .newQueueAdded                  .connect(   queue_view            .add_queue_index_item           )
            queue_controller  .queueDeleted                   .connect(   queue_view            .delete_queue_index_item        )
            queue_controller  .queueNameChanged               .connect(   queue_view            .change_queue_index_item_name   )
            queue_controller  .queuePathChanged               .connect(   queue_view            .change_queue_index_item_path   )
            queue_controller  .queueIndexKeyChanged           .connect(   queue_view            .change_queue_index_item_key    )
            queue_controller  .activeExportQueueChanged           .connect(   queue_view            .active_queue_changed    )

            queue_controller  .newActiveQueueItemAdded                  .connect(   queue_view            .add_active_queue_item                        )
            queue_controller  .activeQueueItemDeleted                   .connect(   queue_view            .delete_active_queue_item                     )
            queue_controller  .activeQueueItemNameChanged               .connect(   queue_view            .change_active_queue_item_name                )
            queue_controller  .activeQueueItemExportDirectoryChanged    .connect(   queue_view            .change_active_queue_item_export_directory    )
            queue_controller  .activeQueueItemIndexKeyChanged           .connect(   queue_view            .change_active_queue_item_key                 )

            queue_controller.activeExportQueueItemStarted.connect(   queue_view            .queue_item_export_started                        )
            queue_controller.activeExportQueueItemFinished.connect(   queue_view            .queue_item_export_finished                     )
            queue_controller.activeExportQueueFinished.connect(queue_view.queue_finished)


            self              .addToActiveQueue                         .connect(   queue_controller.add_item_to_active_queue)



            # queue_controller  .activeExportQueueChanged       .connect(   queue_view            .add_queue_index_item           )

            # self.QueueItemAdded.connect(self._queue_view.add_queue_item)
            # self.QueueDataResponse.connect(self._queue_view.populate_queue_view)
            # self.QueuePathsDataResponse.connect(self._queue_view.populate_queues_combobox)
            logger.info(f'Successfully connected queue panel signals')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to connect queue view signals. Aborting')
            logger.exception(e)
            return

        logger.info(f'Attempting to emit queue panel on FocalPanelBuilt signal with widget: {queue_view}')
        try:
            self.FocalPanelBuilt.emit(queue_view, "Export Queue")
            logger.info(f'Successfully emitted queue panel on FocalPanelBuilt signal')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to emit queue view on FocalPanelBuilt signal. Aborting')
            logger.exception(e)
            return

        queue_view.finish_initialization()

        # queue_controller.add_queue_to_index('name', r'C:\Users\Tanner - Work\Documents\Settings\queuenew.json')


    # def save_current_queue(self, new_queue_path):
    #     print(new_queue_path)
    #     queue_controller.duplicate_current_queue(new_queue_path)
    #     self.emit_queue_paths()

    # @QtCore.Slot()
    # def queue_selected(self, queue_path):
    #     _result = queue_controller.set_current_queue_path(queue_path)
    #     if _result == -1:
    #         logger.warning(f'Queue path: {queue_path} encountered error. Removing from combobox')
    #         self._queue_view.remove_queue(queue_path)
    #
    #     self.QueueDataResponse.emit(queue_controller.current_export_queue())

    # @QtCore.Slot()
    # def emit_queue_paths(self):
    #     self.QueuePathsDataResponse.emit(queue_controller.queue_paths())

    @QtCore.Slot()
    def add_to_active_export_queue(self, scene_data_dict):
        logger.info(f'Caught signal to add item to export queue. Attempting to emit addToActiveQueue')

        export_name = scene_data_dict.get(keys.item_export_name_key)
        selected_animation_ranges = scene_data_dict.get(keys.animation_partitions_key)

        print('yaya', scene_data_dict)


        if not isinstance(selected_animation_ranges, list) or len(selected_animation_ranges) == 0:
            self.addToActiveQueue.emit(scene_data_dict)
            pass

        for _animation_range in selected_animation_ranges:
            _range_export_name = export_name
            _range_export_name = export_name + f"[{_animation_range[0]}_{_animation_range[1]}]"

            # logger.debug(f'New export queue item data: {scene_path, _range_export_name, scene_objects, animation_range, export_directory}')
            try:
                self.addToActiveQueue.emit(scene_data_dict)
                logger.info(f'Successfully emitted addToActiveQueue')
            except Exception as e:
                logger.warning(f'Encountered exception while attempting to emit addToActiveQueue with queue item data. Aborting')
                logger.exception(e)
    # endregion


    # region #######################| SCENE STUFF |##########################

    def _initialize_scene_view_components(self):
        """
        Builds the scene view and item detail view widgets, instantiates the maya delegator
        and connects signals before starting their event loops

        """
        logger.debug(f'Building scene view panel and controller')
        try:


            _scene_view = AnimationExporterSceneView.ExporterSceneView()
            logger.info(f'Scene panel successfully built')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to build scene view. Aborting')
            logger.exception(e)
            return


        _scene_detail_view = self._build_empty_item_detail_panel()

        _scene_view_splitter = base_layouts.Splitter(constants.vertical)
        _scene_view_splitter.setStyleSheet(styles.maya_splitter)
        _scene_view_splitter.addWidget(_scene_view)
        _scene_view_splitter.addWidget(_scene_detail_view)
        _scene_view_splitter.setSizes([450, 300])


        logger.debug(f'Connecting signals between _scene_view, _scene_controller and panel_controller')
        try:

            _scene_view.ItemSelected.connect(self._build_then_add_item_detail_panel)
            _scene_view.SceneSelected.connect(self._write_scene_object_data)

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
    def _write_scene_object_data(self, scene):
        """
        Passes the given scene path and an output path to the maya delegator to write to disk.

        Parameters
        ----------
        scene : str
            The filepath of the scene to write the data of

        """
        _scene_data_filepath = cache.get_unique_file_name(root_name="current_scene_data.json")
        settings.cache_values.set_setting(setting=keys.current_scene_data_file, value=_scene_data_filepath)

        self.writeSceneData.emit(scene, _scene_data_filepath)

    @QtCore.Slot()
    def populate_scene_view_from_cached_scene_data(self):
        """
        Gets the file containing scene data and builds a display for it

        """
        _scene_data_filepath = settings.cache_values.get_setting(keys.current_scene_data_file)

        if os.path.exists(_scene_data_filepath):
            _data = file_management.read_json(_scene_data_filepath)

            _scene_path = _data.get(keys.scene_path_key)
            _scene_data = _data.get(keys.object_data)

            self.populateSceneDataView.emit(_scene_path, _scene_data)

    def _build_empty_item_detail_panel(self):
        """
        Builds a widget to display when the item detail panel is empty

        Returns
        -------
        base_layouts.VerticalLayout
            The empty panel display

        """
        _empty = base_widgets.Label("No Details Yet")
        _widget = base_layouts.VerticalLayout(margins=self.margins)
        _widget.addWidget(_empty, alignment=constants.align_center)
        _widget.setStyleSheet(styles.maya_detail_view)
        return _widget

    @QtCore.Slot()
    def _build_then_add_item_detail_panel(self, item_data):
        """
        Builds an item detail panel from the given dictionary and then emits it
        on the SceneDetailPanelBuilt signal to be added to the UI

        Parameters
        ----------
        item_data : dict
            The item data to build the panel from

        """
        logger.info(f'Signal caught to build scene detail view for dict: {item_data}')

        _item_detail_controller = item_detail_controller.ItemDetailController(
            item_detail_dictionary=item_data
        )
        _item_view = ItemDetailedView.ItemDetailedView(margins=self.margins)

        _item_detail_controller.dataResponse.connect(_item_view.populate_detail_view)
        _item_detail_controller.addToQueue.connect(self.add_to_active_export_queue)
        from functools import partial

        _item_view.dataRequest.connect(_item_detail_controller.emit_data_response)
        _item_view.valueChanged.connect(_item_detail_controller.update_value)
        _item_view.AddToQueueButtonClicked.connect(partial(_item_detail_controller.emit_queue_data))
        _item_view.AddToQueueButtonClicked.connect(partial(print, "yes"))

        _item_view.finish_initialization()

        self.SceneDetailPanelBuilt.emit(_item_view)
    # endregion


    # region #######################| HEADER STUFF |##########################


    def _build_header_panel(self):
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


    def _build_footer_panel(self):
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

