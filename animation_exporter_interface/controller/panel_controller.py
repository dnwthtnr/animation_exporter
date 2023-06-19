import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

from PySide2 import QtCore, QtWidgets, QtGui
from pyqt_interface_elements import (
    base_widgets,
    base_layouts,
    base_windows,
    constants
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
    scene_controller
)

class PanelController(QtCore.QObject):
    HeaderPanelBuilt = QtCore.Signal(object)
    FooterPanelBuilt = QtCore.Signal(object)
    FocalPanelBuilt = QtCore.Signal(object, object)
    ConstructionFinished = QtCore.Signal()


    # region Local Signals
    AddToExportQueue = QtCore.Signal(object, object, object, object, object)
    AddToQueueButtonClicked = QtCore.Signal(str, list)
    SceneSelected = QtCore.Signal(str)
    ExportButtonClicked = QtCore.Signal()
    SceneDetailPanelBuilt = QtCore.Signal(object)

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


    # region #######################| QUEUE STUFF |##########################

    def build_queue_view(self):
        logger.debug(f'Building queue panel and controller')
        try:
            _queue_runner = queue_controller.QueueRunner()
            _queue_view = AnimationExportQueueView.QueueItemHolder()
            _queue_view._controller = _queue_runner
            logger.info(f'Queue panel successfully built')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to build queue view. Aborting')
            logger.exception(e)
            return

        logger.debug(f'Connecting signals between queue_runner, queue_view and panel_controller')
        try:
            _queue_runner.RemoveQueueItem.connect(_queue_view.remove_queue_item)

            _queue_view.RemoveQueueItem.connect(queue_controller.remove_queue_item)
            _queue_view.UpdateQueueItemName.connect(queue_controller.update_queue_item_export_name)
            _queue_view.UpdateQueueItemExportDirectory.connect(queue_controller.update_queue_item_export_directory)
            _queue_view.UpdateQueueItemFrameRange.connect(queue_controller.update_queue_item_export_frame_range)

            self.AddToExportQueue.connect(queue_controller.add_queue_item)
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

    @QtCore.Slot()
    def emit_add_to_export_queue(self, scene_path, export_name, scene_objects, animation_range, export_directory):
        logger.info(f'Caught signal to add item to export queue. Attempting to emit AddToExportQueue')
        logger.debug(f'New export queue item data: {scene_path, export_name, scene_objects, animation_range, export_directory}')
        try:
            self.AddToExportQueue.emit(scene_path, export_name, scene_objects, animation_range, export_directory)
            logger.info(f'Successfully emitted AddToExportQueue')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to emit AddToExportQueue with queue item data. Aborting')
            logger.exception(e)
            return
    # endregion


    # region #######################| SCENE STUFF |##########################

    def build_scene_view(self):
        logger.debug(f'Building scene view panel and controller')
        try:
            _scene_controller = scene_controller.Scene_Controller()
            _scene_view = AnimationExporterSceneView.ExporterSceneView()
            _scene_view._controller = _scene_controller
            logger.info(f'Scene panel successfully built')
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to build scene view. Aborting')
            logger.exception(e)
            return


        _scene_detail_view = self.build_empty_detail_panel()

        _scene_view_splitter = base_layouts.Splitter()
        _scene_view_splitter.addWidget(_scene_view)
        _scene_view_splitter.addWidget(_scene_detail_view)


        logger.debug(f'Connecting signals between _scene_view, _scene_controller and panel_controller')
        try:

            _scene_view.ItemSelected.connect(_scene_controller.emit_item_details_on_thread)

            _scene_controller.SceneContentDataResponse.connect(_scene_view.populate_item_view)
            _scene_controller.ItemDetailsDataResponse.connect(self.generate_scene_detail_panel)


            self.SceneSelected.connect(_scene_controller.open_file)
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

    def build_empty_detail_panel(self):
        _empty = base_widgets.Label("No Details Yet")
        _widget = base_layouts.Vertical_Layout()
        _widget.addWidget(_empty, alignment=constants.align_center)
        return _widget

    @QtCore.Slot()
    def generate_scene_detail_panel(self, item_detail_dictionary):
        _item_view = ItemDetailedView.DetailedViewPanel()

        for _detail_name, _detail_value in item_detail_dictionary.items():
            _item_view.addSection(_detail_name, _detail_value)

        _export_button = _item_view.addButton("Add To Queue")
        _export_button.clicked.connect()

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
            _widget.SceneSelected.connect(self.SceneSelected.emit)
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
            _widget = AnimationExporterFooter.ExporterFooter()
            _widget.ExportButtonClicked.connect(self.ExportButtonClicked.emit)
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

