import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

from PySide2 import QtCore
from functools import partial
from source.utility_resources import userSettings, keys
from source.PySideWrapper import (base_widgets,
                                  buttons, visuals)
from lib.PySideWrapper.source.PySideWrappers import constants, proceadural_displays, dialogs, styles, icons, line_edits, \
    base_layouts

# TODO: Add widget stuff for active queue items

_collapsed_attributes = [keys.queue_item_export_name]
_attributes_to_hide = [keys.queue_item_index_key]
_non_editable_attributes = []


_attrs= [
    proceadural_displays.ChooseDirectoryAttributeEditor,
    proceadural_displays.LineEditAttributeEditor,
    proceadural_displays.TwoDimentionalLineEditAttributeEditor
]

class ExportItem(base_layouts.ExpandWhenClicked):
    deleteExportItem = QtCore.Signal(str)

    changeExportItemName = QtCore.Signal(str, str)
    changeExportItemExportDirectory = QtCore.Signal(str, str)
    changeExportItemIndex = QtCore.Signal(str, str)

    exportItemValueChanged = QtCore.Signal(str, list)

    exportItemAttributeChanged = QtCore.Signal(str, object)

    def __init__(self, queue_item_display_dict):
        super().__init__(margins=[5, 5, 0, 0], spacing=5)

        _title_width = 150
        _button_height = 50


        _item_name = queue_item_display_dict.get(keys.queue_item_export_name)
        _item_export_directory = queue_item_display_dict.get(keys.queue_item_export_directory)
        _item_index = queue_item_display_dict.get(keys.queue_item_index_key)

        self._queue_name_widget = proceadural_displays.NameEditorAttributeEditor(
            attribute_name="Export Name",
            attribute_value=_item_name
        )
        self._queue_name_widget.valueEdited.connect(self._changeExportItemName)

        # print('queueexportdirectory', _item_export_directory, queue_item_display_dict)

        self._queue_export_directory_widget = proceadural_displays.ChooseDirectoryAttributeEditor(
            attribute_name="Export Directory",
            attribute_value=_item_export_directory
        )
        self._queue_export_directory_widget.valueEdited.connect(self._changeExportItemDirectory)

        self._queue_index_widget = line_edits.IntLineEdit(value=_item_index)


        # TODO: Make attribute holder for collapsed and expanded widgets. setup method of modularly calling to update
        #  a queue item value and pass the keys.queueitemvaluename to be updated. Have good logging to make clear
        #   _collapsed_display_attributes = {_attr: _value for _attr, _value in queue_item_display_dict.items() if
        #                                    _attr in _collapsed_attributes}
        #   _collapsed_attribute_holder = proceadural_displays.AttributeHolder(
        #       attribute_dictionary=_collapsed_display_attributes,
        #       attribute_mapper=_attribute_display_classes,
        #       map_by_identity=True,
        #       orientation=constants.horizontal
        #   )
        #   _expanded_display_attributes = {_attr: _value for _attr, _value in queue_item_display_dict.items() if
        #                                    _attr not in _collapsed_attributes}
        #   _expanded_attribute_holder = proceadural_displays.AttributeHolder(
        #       attribute_dictionary=_expanded_display_attributes,
        #       attribute_mapper=_attribute_display_classes,
        #       map_by_identity=True,
        #       orientation=constants.horizontal
        #   )
        #   _expanded_attribute_holder.valueChanged.connect(self.queueItemAttributeChanged.emit)
        #   self.addCollapsedWidget(_collapsed_attribute_holder, stretch=1)
        #   self.addCollapsedWidget(_delete_button, alignment=constants.align_right)
        #   self.addExpandedWidget(_expanded_attribute_holder)
        self._export_status_icon = self._buildExportStatusIcon(_button_height)

        self.addCollapsedWidget(self._queue_name_widget)
        self.addCollapsedWidget(self._export_status_icon)

        self._expandedAttributeHolder = proceadural_displays.AttributeHolder(
            attribute_dictionary=queue_item_display_dict,
            attribute_mapper=_attrs,
            map_by_type=False,
            map_by_identity=True,
            attributes_to_hide=userSettings.exportItemsHiddenAttributes()
        )
        self._expandedAttributeHolder.valueChanged.connect(self._changeExportItemValue)

        self.addExpandedWidget(self._expandedAttributeHolder)

        self.set_expanded_stylesheet(styles.maya_expanded_collapsible_layout)
        self.set_collapsed_stylesheet(styles.maya_collapsed_layout)

    def _changeExportItemValue(self, attribute, value):
        self.exportItemValueChanged.emit(self.exportItemIndex(), [attribute, value])

    def _changeExportItemName(self, new_name):
        self.changeExportItemName.emit(self.exportItemIndex(), new_name)
    def _changeExportItemDirectory(self, new_directory):
        self.changeExportItemExportDirectory.emit(self.exportItemIndex(), new_directory)
    def _changeExportItemIndex(self, new_index):
        self.changeExportItemIndex.emit(self.exportItemIndex(), new_index)


    def exportItemName(self):
        return self._queue_name_widget.attribute_value

    def setExportItemName(self, new_name):
        self._queue_name_widget.setAttributeValue(new_name)


    def exportItemExportDirectory(self):
        return self._queue_export_directory_widget.attribute_value

    def setExportItemExportDirectory(self, new_directory):
        self._queue_export_directory_widget.setAttributeValue(new_directory)


    def exportItemIndex(self):
        return self._queue_index_widget.text()

    def setExportItemIndex(self, new_index):
        self._queue_index_widget.setText(new_index)

    def _buildExportStatusIcon(self, size):
        _widget = base_layouts.HorizontalLayout()
        return _widget

    def setStatusIcon(self, widget):
        self._export_status_icon.clear_layout()
        _height = self._queue_name_widget.height()

        self._export_status_icon.addWidget(widget)
        self._export_status_icon.setMaximumHeight(_height)

    def exportStarted(self):
        self.setStatusIcon(visuals.loading_wheel())

    def exportFinished(self):
        self.setStatusIcon(base_layouts.VerticalLayout())

    # def delete_queue(self):
    #     self.close()

class Queue(base_layouts.ExpandWhenClicked):
    deleteQueueTrigger = QtCore.Signal(str)
    changeQueueNameTrigger = QtCore.Signal(str, str)

    def __init__(self, queue_name, queue_path, queue_index_key):
        super().__init__(margins=[5, 5, 0, 0], spacing=5)

        _title_width = 150

        self._queue_index_key = queue_index_key
        self._queue_name = self._buildQueueNameWidget(name=queue_name, width=_title_width)
        self._queue_path = self._buildQueuePathWidget(path=queue_path, width=_title_width)

        self.addCollapsedWidget(self._queue_name, stretch=1)

        self.addExpandedWidget(self._queue_path)

        self.set_expanded_stylesheet(styles.maya_expanded_collapsible_layout)
        self.set_collapsed_stylesheet(styles.maya_collapsed_layout)

    def queueIndex(self):
        return self._queue_index_key

    def setQueueIndex(self, queue_index_key):
        self._queue_index_key = queue_index_key

    def _buildQueueNameWidget(self, name, width=None):
        _widget = proceadural_displays.NameEditorAttributeEditor(attribute_name="Export File Name:", attribute_value=name)
        _widget.valueEdited.connect(self.changeQueueName)

        if width is not None:
            _widget.setMinimumWidth(width)

        return _widget

    def queueName(self):
        return self._queue_name.attribute_value

    def setQueueName(self, new_name):
        self._queue_name.setAttributeValue(new_name)

    def changeQueueName(self, new_name):
        self.changeQueueNameTrigger.emit(self.queueIndex(), new_name)

    def _buildQueuePathWidget(self, path, width=None):

        _widget = proceadural_displays.LineEditAttributeEditor(attribute_name="Scene Path:", attribute_value=path)
        # _widget.valueEdited.connect(self.emit_export_name_changed)
        _widget.setReadOnly(True)

        if width is not None:
            _widget.setMinimumWidth(width)

        return _widget

    def queuePath(self):
        return self._queue_path.attribute_value

    def setQueuePath(self, new_queue_path):
        self._queue_path.setAttributeValue(new_queue_path)

    def deleteQueue(self):
        self.close()

class QueueEditor(base_layouts.VerticalLayout):

    requestingExistingQueueIndex = QtCore.Signal()

    # region Queue Index Signals
    addNewQueueTrigger             =   QtCore.Signal(str, str)
    duplicateQueueTrigger          =   QtCore.Signal(str)
    deleteQueueTrigger             =   QtCore.Signal(object)
    changeQueueNameTrigger         =   QtCore.Signal(str, str)
    changeQueueDirectoryTrigger    =   QtCore.Signal(str, str)
    changeQueueIndexTrigger        =   QtCore.Signal(str, str)

    changeActiveQueue       =   QtCore.Signal(str)
    # endregion

    # region Export Item Signals
    requestingActiveQueueItems              =   QtCore.Signal()

    exportItemValueChanged = QtCore.Signal(str, list)

    deleteExportItemTrigger                   =   QtCore.Signal(str)
    changeExportItemNameTrigger               =   QtCore.Signal(str, str)
    changeExportItemDirectoryTrigger    =   QtCore.Signal(str, str)
    changeExportItemIndexTrigger              =   QtCore.Signal(str, str)

    startActiveQueue                        =   QtCore.Signal()
    stopActiveQueue                         =   QtCore.Signal()
    _activeQueueFinished = QtCore.Signal()
    # endregion

    def finish_initialization(self):
        self.requestingExistingQueueIndex.emit()

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        print('spawning')
        self.queueEditorDialog = self._buildQueueEditDialog()
        self.queueSelectorCombo = self._buildQueueSelectorCombo()
        queue_manager_toolbar = self._buildExportItemToolbar(queue_selector=self.queueSelectorCombo)

        exportItemActionToolbar = self._buildExportItemActions()

        self.exportItemHolder = self._buildExportItemHolder()

        focalLayout = base_layouts.HorizontalLayout(margins=2, spacing=10)
        focalLayout.addWidget(exportItemActionToolbar, alignment=constants.align_left)
        focalLayout.addWidget(self.exportItemHolder, stretch=1)

        self.addWidget(queue_manager_toolbar, alignment=constants.align_top)
        self.addWidget(focalLayout)

    # region Dialog
    def openQueueEditDialog(self):
        self.queueEditorDialog.show()
        self.queueEditorDialog.resize(*userSettings.queueWindowSize())
        self.queueEditorDialog.move(self.mapToGlobal(self.pos()))

    def _buildQueueEditDialog(self):
        _queue_editor_dialog= base_windows.Main_Window(parent=self)
        self.queueHolder = self._buildQueueHolder()
        _queueHolderScrollArea = base_layouts.VerticalScrollArea()
        _queueHolderScrollArea.addWidget(self.queueHolder)

        queueToolbar = self._buildQueueEditToolbar()
        _queue_editor_layout = base_layouts.VerticalLayout(margins=10)
        _queue_editor_layout.addWidget(queueToolbar, alignment=constants.align_top)
        _queue_editor_layout.addWidget(_queueHolderScrollArea, stretch=1)

        _queue_editor_dialog.setCentralWidget(_queue_editor_layout)
        _queue_editor_dialog.setWindowFlag(QtCore.Qt.Tool, True)

        return _queue_editor_dialog

    def _buildQueueEditToolbar(self):
        _duplicate_queue_button = self._buildDuplicateQueueButton()

        _add_queue_button = self._buildAddQueueButton()
        _deleteQueueButton = self._buildDeleteQueueButton()

        _widget = base_layouts.HorizontalLayout()
        _widget.addStretch(1)
        _widget.addWidget(_duplicate_queue_button)
        _widget.addWidget(_deleteQueueButton)
        _widget.addWidget(_add_queue_button)
        return _widget

    def _buildAddQueueButton(self):
        """
        Builds a button displaying the duplicate icon that calls duplicate_queue_button_clicked when clicked

        Returns
        -------
        base_widgets.Tool_Button
            The new button

        """
        _widget = base_widgets.Tool_Button()
        _widget.setToolTip(f'Add new queue')
        _widget.setIcon(icons.plus)
        _widget.clicked.connect(self._buildAddQueueDialog)
        return _widget

    def _buildDuplicateQueueButton(self):
        """
        Builds a button displaying the duplicate icon that calls duplicate_queue_button_clicked when clicked

        Returns
        -------
        base_widgets.Tool_Button
            The new button

        """
        _widget = base_widgets.Tool_Button()
        _widget.setToolTip(f'Duplicate queue')
        _widget.setIcon(icons.duplicate)
        _widget.clicked.connect(self.duplicateQueueButtonClickEvent)
        return _widget

    def _buildAddQueueButton(self):
        """
        Builds a button displaying the plus icon that calls _build_new_queue_dialog when clicked

        Returns
        -------
        base_widgets.Tool_Button
            The new button

        """
        _widget = base_widgets.Tool_Button()
        _widget.setToolTip(f'Add new queue')
        _widget.setIcon(icons.plus)
        _widget.clicked.connect(self._buildAddQueueDialog)
        return _widget

    def _buildAddQueueDialog(self):

        self._new_queue_dialog = dialogs.FileDialog(parent=self)
        self._new_queue_dialog.setWindowFlag(QtCore.Qt.Tool, True)
        self._new_queue_dialog.setWindowModality(QtCore.Qt.WindowModal)
        self._new_queue_dialog.appendAddFileOption(
            text="New Queue:",
            file_extensions=['.json'],

        )
        self._new_queue_dialog.fileSelected.connect(self._newQueueFileSelectedEvent)

        self._new_queue_dialog.show()

    def _buildDeleteQueueButton(self):
        _widget = base_widgets.Tool_Button()
        _widget.setIcon(icons.delete)
        _widget.setToolTip(f"Delete queue")
        _widget.clicked.connect(self._deleteQueueButtonClicked)
        return _widget

    @QtCore.Slot("_deleteExportItemButtonClicked")
    def _deleteQueueButtonClicked(self):
        if userSettings.askBeforeExportItemDeletion() is False:
            self.emitDeleteSelectedQueues()
            return
        self._confirmationDialog = dialogs.ConfirmDialogue(
            display_text=f'Are you sure you want to delete the selected queue(s)?\nThis action will result in permanent data loss.',
            parent=self
        )
        self._confirmationDialog.confirmed.connect(self.emitDeleteSelectedQueues)
        self._confirmationDialog.show()

    def emitDeleteSelectedQueues(self):
        """
        Iterates through the currently selected export item
        indexes and emits them on the delteExportItemTrigger signal

        """
        for _index in self.selectedQueues():
            self.deleteQueueTrigger.emit(_index)

    def _newQueueFileSelectedEvent(self, filepath):
        """
        Emits the
        Parameters
        ----------
        filepath

        Returns
        -------

        """
        logger.info(f'Add queue button clicked. Emitting addNewQueue')
        self.addNewQueueTrigger.emit(filepath, filepath)

    def deleteQueueButtonClickEvent(self, queue_index_key):
        logger.info(f'Delete queue button clicked. Emitting deleteQueue {queue_index_key}')
        try:
            self.deleteQueueTrigger.emit(queue_index_key)
        except Exception as e:
            raise e

    def duplicateQueueButtonClickEvent(self):
        self.duplicateQueueTrigger.emit()
    # endregion

    # region Combo
    def _buildExportItemToolbar(self, queue_selector):
        """
        Builds a toolbar for selecting an active queue, starting it, and holds the entry point for the queue manager

        Parameters
        ----------
        queue_selector

        Returns
        -------

        """
        _open_editor_button = self._buildOpenQueueEditorButton()
        _start_queue_button = self._buildStartQueueButton()


        _current_queue_label = base_widgets.Label(text="Current Queue: ")

        # _exportItemActions = self._buildExportItemActions()

        _widget = base_layouts.HorizontalLayout()
        _widget.addWidget(_current_queue_label, alignment=constants.align_left)
        _widget.addWidget(queue_selector, stretch=1)
        _widget.addWidget(_start_queue_button, alignment=constants.align_right)
        _widget.addWidget(_open_editor_button, alignment=constants.align_right)

        return _widget

    def _buildExportItemActions(self):
        _deleteExportItemButton = self._buildDeleteExportItemButton()

        _widget = base_layouts.VerticalLayout()
        _widget.addStretch(1)
        _widget.addWidget(_deleteExportItemButton)
        return _widget

    def _buildDeleteExportItemButton(self):
        _widget = base_widgets.Tool_Button()
        _widget.setIcon(icons.delete)
        _widget.setToolTip(f"Delete queue")
        _widget.clicked.connect(self._deleteExportItemButtonClicked)
        return _widget

    @QtCore.Slot("_deleteExportItemButtonClicked")
    def _deleteExportItemButtonClicked(self):
        print(self.selectedExportItems())
        if userSettings.askBeforeExportItemDeletion() is False:
            self.emitDeleteSelectedItems()
            return
        self._confirmationDialog = dialogs.ConfirmDialogue(
            display_text=f'Are you sure you want to delete the selected export items?\nThis action will result in permanent data loss.',
            parent=self
        )
        self._confirmationDialog.confirmed.connect(self.emitDeleteSelectedItems)
        self._confirmationDialog.show()

    def emitDeleteSelectedItems(self):
        """
        Iterates through the currently selected export item
        indexes and emits them on the delteExportItemTrigger signal

        """
        for _index in self.selectedExportItems():
            self.deleteExportItemTrigger.emit(_index)

    def _buildOpenQueueEditorButton(self):
        _button = base_widgets.Tool_Button()
        _button.setIcon(icons.gear)
        _button.setToolTip(f'Open queue index editor')
        _button.clicked.connect(self.openQueueEditDialog)
        return _button

    def _buildQueueSelectorCombo(self):
        _widget = base_widgets.ComboBox()
        _widget.currentTextChanged.connect(self._queueSelectorComboChanged)
        return _widget

    def _queueSelectorComboChanged(self, *args):
        _new_selection = self.queueSelectorCombo.currentText()
        _queue_item = self.getQueueFromName(_new_selection)

        self.changeActiveQueue.emit(_queue_item.queueIndex())

    def activeQueueChangeEvent(self):
        self.exportItemHolder.clear_layout()
        self.requestingActiveQueueItems.emit()

    def _buildStartQueueButton(self):
        _widget = buttons.ToggleIconButton(enabled_icon=icons.stop, disabled_icon=icons.start)
        _widget.enabled.connect(self.startActiveQueue.emit)
        _widget.disabled.connect(self.stopActiveQueue.emit)

        self._activeQueueFinished.connect( partial(_widget.setIconState, enabled=False, silent=True) )

        return _widget

    # endregion

    # region Queue Editing Methods

    def _buildQueueHolder(self):
        _widget = base_layouts.VerticalSelectableObjectHolder()
        _widget.setSelectionMode(base_layouts.SelectableObjectHolder.MultiSelection)
        _widget.addStretch(1)
        return _widget

    def selectedQueues(self):
        """
        Query the current selected export items and gets the respective indexes

        Returns
        -------
        list[str]
            A list of the ExportItem export item indexes

        """
        _items = self.queueHolder.currentSelection()
        _itemIndexes = [_item.queueIndex() for _item in _items]
        return _itemIndexes

    def addQueueEvent(self, queue_name, queue_path, queue_index_key):
        logger.info(f'Received signal to add queue. {queue_name, queue_path, queue_index_key}')
        _item = Queue(
            queue_name=queue_name,
            queue_path=queue_path,
            queue_index_key=queue_index_key
        )
        _item.changeQueueNameTrigger.connect(self.changeQueueNameTrigger.emit)
        _item.deleteQueueTrigger.connect(self.deleteQueueButtonClickEvent)
        self.queueHolder.addWidget(_item)

        self.queueSelectorCombo.addItem(queue_name)

    def getQueueFromIndex(self, queueIndex):
        for _selectionLayout in self.queueHolder.children():
            _widget = _selectionLayout.children()[0]
            if not isinstance(_widget, Queue):
                continue

            if _widget.queueIndex() == queueIndex:
                return _widget

    def getQueueFromName(self, queue_name):
        for _selectionLayout in self.queueHolder.selectionLayouts():
            print(_selectionLayout.children(), 'chil')
            _widget = _selectionLayout.children()[0]
            if not isinstance(_widget, Queue):
                continue

            if _widget.queueName() == queue_name:
                return _widget

    def deleteQueueEvent(self, queue_index_key):
        """
        Removes the queue item with the given index key from the queue editor and selector

        Parameters
        ----------
        queue_index_key : str
            The queue key that identifies the queue to delete

        """
        _queue_item = self.getQueueFromIndex(queue_index_key)

        # remove from combo
        _queue_combo_index = self.queueSelectorCombo.findText(_queue_item.queueName())
        self.queueSelectorCombo.removeItem(_queue_combo_index)

        _queue_item.deleteQueue()

    def changeQueueNameEvent(self, queue_index_key, new_name):
        _queue_item = self.getQueueFromIndex(queue_index_key)
        _old_name = _queue_item.queueName()
        _queue_item.setQueueName(new_name)

        # add to combo
        # print(_old_name, 'delete')
        _queue_combo_index = self.queueSelectorCombo.findText(_old_name)
        self.queueSelectorCombo.removeItem(_queue_combo_index)
        self.queueSelectorCombo.addItem(new_name)

    def changeQueuePathEvent(self, queue_index_key, new_path):
        _queue_item = self.getQueueFromIndex(queue_index_key)
        _queue_item.setQueuePath(new_path)

    def changeQueueKeyEvent(self, queue_index_key, new_index_key):
        _queue_item = self.getQueueFromIndex(queue_index_key)
        _queue_item.setQueueIndex(new_index_key)
    # endregion


    # region Active Queue

    def _buildExportItemHolder(self):
        _widget = base_layouts.VerticalSelectableObjectHolder()
        _widget.setSelectionMode(base_layouts.SelectableObjectHolder.MultiSelection)
        _widget.setStyleSheet(styles.maya_outliner)
        _widget.addStretch(1)
        return _widget

    def selectedExportItems(self):
        """
        Query the current selected export items and gets the respective indexes

        Returns
        -------
        list[str]
            A list of the ExportItem export item indexes

        """
        _items = self.exportItemHolder.currentSelection()
        _itemIndexes = [_item.exportItemIndex() for _item in _items]
        print(_items, _itemIndexes)
        return _itemIndexes

    def addExportItemEvent(self, queue_item_display_dict):
        _item = ExportItem(queue_item_display_dict)

        _item.exportItemValueChanged.connect(self.exportItemValueChanged.emit)
        _item.  deleteExportItem                   .connect(self.deleteExportItemTrigger.emit)
        _item.  changeExportItemName               .connect(self.changeExportItemNameTrigger.emit)
        _item.  changeExportItemExportDirectory    .connect(self.changeExportItemDirectoryTrigger.emit)
        _item.  changeExportItemIndex              .connect(self.changeExportItemIndexTrigger.emit)

        self.exportItemHolder.addWidget(_item)

    def deleteExportItemEvent(self, queue_index_key):
        """
        Removes the queue item with the given index key from the queue editor and selector

        Parameters
        ----------
        queue_index_key : str
            The queue key that identifies the queue to delete

        """
        logger.info(f'Going to disown child queue item for index: {queue_index_key} in queue')
        _queue_item = self.getExportItemFromIndex(queue_index_key)
        logger.info(f'Child widget founnd: {_queue_item} going to disown')

        self.exportItemHolder.disown_child(_queue_item)

    def getExportItemFromIndex(self, queue_item_index_key):
        for _selectionLayout in self.exportItemHolder.children():
            _widget = _selectionLayout.children()[0]
            if not isinstance(_widget, ExportItem):
                continue

            if _widget.exportItemIndex() == queue_item_index_key:
                return _widget

    def getExportItemFromName(self, queue_item_name):
        for _widget in self.exportItemHolder.children():
            if not isinstance(_widget, ExportItem):
                continue

            if _widget.exportItemName() == queue_item_name:
                return _widget

    def changeExportItemNameEvent(self, queue_item_index_key, new_name):
        _queue_item = self.getExportItemFromIndex(queue_item_index_key)
        _queue_item.setExportItemName(new_name)

    def changeExportItemDirectoryEvent(self, queue_index_key, new_path):
        _queue_item = self.getExportItemFromIndex(queue_index_key)
        _queue_item.setExportItemExportDirectory(new_path)

    def changeExportItemKeyEvent(self, queue_index_key, new_index_key):
        logger.info(f'Going to index for item: {queue_index_key} in queue to {new_index_key}')
        _queue_item = self.getExportItemFromIndex(queue_index_key)
        logger.info(f'Child widget found: {_queue_item} going to change')
        _queue_item.setExportItemIndex(new_index_key)

    def exportItemExportStartEvent(self, queue_item_index_key):
        _queue_item = self.getExportItemFromIndex(queue_item_index_key)
        _queue_item.exportStarted()

    def exportItemExportFinishEvent(self, queue_item_index_key):
        _queue_item = self.getExportItemFromIndex(queue_item_index_key)
        _queue_item.exportFinished()

    def queueExportFinishEvent(self):
        # print('fin')
        logger.info(f'Received signal that active queue has finished')
        self._activeQueueFinished.emit()


if __name__ == "__main__":
    from source.PySideWrapper import base_windows
    import sys
    from PySide2 import QtWidgets


    _app = QtWidgets.QApplication(sys.argv)
    # _view = QueueEditor()
    # _view.setStyleSheet(styles.maya_detail_view)
    #
    # _view.add_queue_index_item("name1", "pathhhh", "1")
    # _view.add_queue_index_item("name2", "pathhhh", "12")
    # _view.add_queue_index_item("name32", "pat", "7")
    # _view.add_queue_index_item("name4444", "h", "5")

    _view = buttons.ToggleIconButton(enabled_icon=icons.stop, disabled_icon=icons.start)

    # _win = base_windows.Main_Window()
    # _win.setCentralWidget(_view)
    _view.show()

    sys.exit(_app.exec_())