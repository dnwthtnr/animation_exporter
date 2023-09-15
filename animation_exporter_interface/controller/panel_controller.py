import copy

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
item_detail_controller,
SceneDataController
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

    _writeSceneData = QtCore.Signal(str, str)
    _sceneDataWritten = QtCore.Signal(str)
    _setScenePath = QtCore.Signal(str)
    startQueue = QtCore.Signal()

    # endregion

    @QtCore.Slot()
    def start_construction(self):
        logger.info(f'Beginning construction of panels')
        self._build_header_panel()
        self._build_footer_panel()
        self._initialize_scene_view_components()
        self.build_queue_view()
        logger.info(f'Construction of panels complete')

    def __init__(self, margins, *args, **kwargs):

        super().__init__(*args, **kwargs)
        self.margins = margins

        self.worker_thread = QtCore.QThread()
        self.worker_thread.start()

        self._maya_delegator = maya_process_delegator.MayaProcessDelegator()
        self._maya_delegator.moveToThread(self.worker_thread)

        self._writeSceneData.connect(self._maya_delegator.open_file_write_scene_data)


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

            # region Queues Hookup
            queue_view        .requestingExistingQueueIndex   .connect(   queue_controller      .finish_initialization          )
            queue_view        .addNewQueueTrigger                    .connect(queue_controller.add_queue_to_index)
            queue_view        .duplicateQueueTrigger                 .connect(queue_controller      .duplicate_queue)
            queue_view        .deleteQueueTrigger                    .connect(queue_controller      .remove_queue_from_index)
            queue_view        .changeQueueNameTrigger                .connect(queue_controller      .change_queue_name)
            queue_view        .changeQueueDirectoryTrigger           .connect(queue_controller      .change_queue_path)
            queue_view        .changeQueueIndexTrigger               .connect(queue_controller      .change_queue_index_position)

            queue_view        .changeActiveQueue              .connect(   queue_controller      .set_active_export_queue        )
            queue_view        .requestingActiveQueueItems     .connect(   queue_controller      .emit_active_queue_item_data_response        )

            # region Active Queue Hookup
            queue_view        .deleteExportItemTrigger                    .connect(queue_controller      .remove_item_from_active_queue)
            queue_view        .changeExportItemNameTrigger                .connect(queue_controller      .change_active_queue_item_name)
            queue_view        .changeExportItemIndexTrigger               .connect(queue_controller      .change_active_queue_item_index_position)
            queue_view.exportItemValueChanged.connect(queue_controller.changeExportItemValue)

            queue_view.startActiveQueue.connect(queue_controller.start_queue)
            queue_view.stopActiveQueue.connect(queue_controller.stop_queue)


            queue_controller  .newQueueAdded                  .connect(queue_view            .addQueueEvent)
            queue_controller  .queueDeleted                   .connect(queue_view            .deleteQueueEvent)
            queue_controller  .queueNameChanged               .connect(queue_view            .changeQueueNameEvent)
            queue_controller  .queuePathChanged               .connect(queue_view            .changeQueuePathEvent)
            queue_controller  .queueIndexKeyChanged           .connect(queue_view            .changeQueueKeyEvent)
            queue_controller  .activeExportQueueChanged           .connect(queue_view            .activeQueueChangeEvent)

            queue_controller  .newActiveQueueItemAdded                  .connect(queue_view            .addExportItemEvent)
            queue_controller  .activeQueueItemDeleted                   .connect(queue_view            .deleteExportItemEvent)
            queue_controller  .activeQueueItemNameChanged               .connect(queue_view            .changeExportItemNameEvent)
            queue_controller  .activeQueueItemExportDirectoryChanged    .connect(queue_view            .changeExportItemDirectoryEvent)
            queue_controller  .activeQueueItemIndexKeyChanged           .connect(queue_view            .changeExportItemKeyEvent)

            queue_controller.activeExportQueueItemStarted.connect(queue_view            .exportItemExportStartEvent)
            queue_controller.activeExportQueueItemFinished.connect(queue_view            .exportItemExportFinishEvent)
            queue_controller.activeExportQueueFinished.connect(queue_view.queueExportFinishEvent)


            self              .addToActiveQueue                         .connect(   queue_controller.add_item_to_active_queue)
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

    @QtCore.Slot()
    def add_to_active_export_queue(self, scene_data_dict):
        logger.info(f'Caught signal to add item to export queue. Attempting to emit addToActiveQueue')

        export_name = scene_data_dict.get(keys.item_export_name_key)
        selected_animation_ranges = scene_data_dict.get(keys.queue_item_animation_range)

        print(selected_animation_ranges)


        if not isinstance(selected_animation_ranges, list) or len(selected_animation_ranges) == 0:
            _entry_scene_data_dict = copy.deepcopy(scene_data_dict)
            _entry_scene_data_dict[keys.item_export_name_key] = export_name + f"_RANGE(N/A)"
            self.addToActiveQueue.emit(_entry_scene_data_dict)
            return

        if False in [isinstance(_item, list) for _item in selected_animation_ranges]:
            _entry_scene_data_dict = copy.deepcopy(scene_data_dict)

            _entry_scene_data_dict[keys.item_export_name_key] = export_name + f"_RANGE({selected_animation_ranges[0]}_{selected_animation_ranges[1]})"
            _entry_scene_data_dict[keys.animation_range_key] = selected_animation_ranges
            try:
                self.addToActiveQueue.emit(_entry_scene_data_dict)
                logger.info(f'Successfully emitted addToActiveQueue')
            except Exception as e:
                logger.warning(f'Encountered exception while attempting to emit addToActiveQueue with queue item data. Aborting')
                logger.exception(e)

            return


        for _animation_range in selected_animation_ranges:
            _entry_scene_data_dict = copy.deepcopy(scene_data_dict)

            _entry_scene_data_dict[keys.item_export_name_key] = export_name + f"_RANGE({_animation_range[0]}_{_animation_range[1]})"
            _entry_scene_data_dict[keys.animation_range_key] = _animation_range
            try:
                self.addToActiveQueue.emit(_entry_scene_data_dict)
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
        scene_data_controller = SceneDataController.SceneDataController()

        logger.debug(f'Building scene view panel and controller')
        try:
            scene_view = AnimationExporterSceneView.ExporterSceneView()
            logger.info(f'Scene panel successfully built')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to build scene view. Aborting')
            logger.exception(e)
            return

        scene_view.controller = scene_data_controller

        _scene_detail_view = self._build_empty_item_detail_panel()

        _scene_view_splitter = base_layouts.Splitter(constants.vertical)
        _scene_view_splitter.setStyleSheet(styles.maya_splitter)
        _scene_view_splitter.addWidget(scene_view)
        _scene_view_splitter.addWidget(_scene_detail_view)
        _scene_view_splitter.preferredSizes = [450, 300]
        _scene_view_splitter.restorePrefferedSizes()


        logger.debug(f'Connecting signals between scene_view, _scene_controller and panel_controller')
        try:
            scene_view.sceneItemSelectionChanged.connect(scene_data_controller.itemSelectionChanged)
            scene_view.SceneSelected.connect(scene_data_controller.sceneSelectionChanged)

            scene_data_controller.newSceneDataModel.connect(scene_view.setItemModel)
            scene_data_controller.writeSceneData.connect(self._maya_delegator.open_file_write_scene_data)
            scene_data_controller.newItemData.connect(self._build_then_add_item_detail_panel)
            scene_data_controller.newScenePath.connect(scene_view.setScenePath)
            scene_data_controller.writingSceneData.connect(scene_view.setFileLoadingState)

            scene_data_controller.writingSceneData.connect(partial(self.changeSplitterSizes, splitter=_scene_view_splitter))
            scene_data_controller.writingSceneData.connect(_scene_detail_view.clear_layout)

            self._maya_delegator.sceneDataWritten.connect(scene_data_controller.readSceneData)

            self.SceneDetailPanelBuilt.connect(_scene_detail_view.clearAndAddWidget)
            logger.info(f'Successfully connected scene view signals')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to connect scene view signals. Aborting')
            logger.exception(e)
            return

        logger.info(f'Emitting FocalPanelBuilt with widget: {scene_view}')
        try:
            scene_view.show()
            self.FocalPanelBuilt.emit(_scene_view_splitter, "Scene View")
        except Exception as e:
            logger.warning(f'Ecountered exception when attempting to emit FocalPanelBuilt with scene view')
            logger.exception(e)

        try:
            scene_view.finish_initialization()
        except Exception as e:
            logger.exception(e)


        logger.info(f'Attempting to read cached scene data')
        try:
            scene_data_controller.readSceneData()
        except Exception as e:
            logger.warning(f'Ecountered exception when attempting to read cached scene data. Aborting.')
            logger.exception(e)

    def changeSplitterSizes(self, condition, splitter):
        if condition is True:
            splitter.collapse(0)
            return
        splitter.restorePrefferedSizes()

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

        self._writeSceneData.emit(scene, _scene_data_filepath)

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

