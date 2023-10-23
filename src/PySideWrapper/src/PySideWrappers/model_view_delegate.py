from PySide2 import QtWidgets

# TODO stuff is not working
import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

"""
This file holds a data mode class specialized for the organization of catalog content data
"""
from PySide2 import QtCore
from . import icons

from logviewer import logcontroller


def getDataFromSelectionModelSelection(selectionModelIndexes, dataModel, role, column):
    """
    Gets role data from the given model using the given selection model indexes.

    Parameters
    ----------
    selectionModelIndexes : list[QtCore.QModelIndex]
        The selection indexes to get data for
    dataModel : QtCore.QAbstractItemModel
        The data model to query data from
    role : QtCore.Qt.ItemDataRole
        Role to get index data for
    column : int
        The column index to query data from

    Returns
    -------
    list
        A list of the model data derived from the given selection model indexes and role

    """
    return_data = []
    # print('called', selectionModelIndexes)
    for selectionIndex in selectionModelIndexes:
        _model_index = dataModel.index(selectionIndex.row(), column, dataModel.parent(selectionIndex.parent()))
        _model_data = dataModel.data(_model_index, role)
        # print(_model_data)
        return_data.append(_model_data)

    return return_data

def removeItemsFromList(targetList, itemsToRemove):
    returnIndexList = targetList
    for _item in itemsToRemove:
        if _item in targetList:
            _listIndex = returnIndexList.index(_item)
            returnIndexList.pop(_listIndex)

    return returnIndexList

def addItemsToList(targetList, itemsToAdd):

    # print('return',targetList, itemsToAdd)
    for _item in itemsToAdd:
        # print(_item)
        targetList.append(_item)

    # print('return',targetList)

    return targetList




class CatalogContentTableModel(QtCore.QAbstractTableModel):
    CatalogEmpty = QtCore.Signal()

    def __init__(self, catalog_content_dict):
        """
        This class models the given catalog content data for use to be displayed.

        Parameters
        ----------
        catalog_content_dict : dict
            The catalog content data to organize for displaying
        """
        self.empty_catalog = {
                "No Catalog Selected": {
                    "Name": "No projects are present in the catalog"
                }
            }
        super().__init__()
        if catalog_content_dict == {}:
            self.catalog_content_dict = self.empty_catalog
            self._empty = True
        else:
            self._empty = False
            self.catalog_content_dict = catalog_content_dict

        self.headers = ["Project Name", "Asset Group", "Local Check-in Status", "Last Modified"]

    def finish_initialization(self):
        """
        Emits empty signal if the dictionary has nothing in it

        """
        if self.catalog_content_dict == self.empty_catalog:
            self.CatalogEmpty.emit()

    def key_for_row(self, row):
        """
        For the given row number will return the key
        that represents it in the data dictionary

        Parameters
        ----------
        row : int
            The row to get

        Returns
        -------
        str
            The key representing the given row

        """
        data_keys = list(self.catalog_content_dict.keys())
        return data_keys[row]

    def row_for_key(self, key):
        """
        Gets the row that the given key would take up

        Parameters
        ----------
        key : str
            The key to get the row value for (project name)

        Returns
        -------
        int
            The row number

        """
        _data_keys = list(self.catalog_content_dict.keys())
        for _row in range(0, self.rowCount()):
            if self.key_for_row(_row) == key:
                return _row

    def rowCount(self, parent=None, *args, **kwargs):
        """
        The amount of rows in the model

        Parameters
        ----------
        parent : QModelIndex
            Parent index
        args :
        kwargs :

        Returns
        -------
        int
            The amount of rows

        """
        return len(list(self.catalog_content_dict.keys()))

    def columnCount(self, parent=None, *args, **kwargs):
        """
        Column amount is based on the amount of data given in the dict for each project

        Parameters
        ----------
        parent : QtCore.QModelIndex
            The parent model index -- not applicable in a table model
        args :
        kwargs :

        Returns
        -------
        int
            The amount of columns

        """
        _key_for_first_row = self.key_for_row(0)
        _dict_for_first_row = self.catalog_content_dict[_key_for_first_row]
        return len(_dict_for_first_row)

    def data(self, index, role=None):
        """
        Returns the data for the given index and role

        Parameters
        ----------
        index : QtCore.QModelIndex
            The index to get data for
        role : QtCore.Qt.Role
            The role to get data for

        Returns
        -------
        object
            The data for the given row and role

        """
        if role == QtCore.Qt.DisplayRole:
            _row = index.row()
            _column = index.column()

            _key_for_row = self.key_for_row(_row)       # project name -- is key for the main contents dict
            _dict_for_row = self.catalog_content_dict[_key_for_row]     # the dictionary for that given project
            _dict_key_list = list(_dict_for_row.values())       # list of that dicts values

            return _dict_key_list[_column]

    def headerData(self, section, orientation, role=None):
        """
        Returns the header data for the given index and role

        Parameters
        ----------
        section : int
            The index to get header data for.
        orientation : QtCore.Qt.Orientation
            The orientation of the header to get data for.
        role : QtCore.Qt.Role
            The role to get header data for.

        Returns
        -------
        object
            The header data for the given header index and row

        """
        if role != QtCore.Qt.DisplayRole or orientation == QtCore.Qt.Vertical:
            return None
        else:
            if section >= len(self.headers):
                return None
            else:
                _text = self.headers[section]
            return _text

####################################################

class Node:

    def __init__(self, node_data_dictionary):
        self.parent = node_data_dictionary.get("Parent")
        self.children = node_data_dictionary.get("Children")
        self.unique_name = node_data_dictionary.get("Object Name", "")
        self.animation_range = node_data_dictionary.get("Absolute Animation Range", "")
        self.type = node_data_dictionary.get("Type", "")

        self.data_dictionary = node_data_dictionary

        self.parent_node = None
        self.child_nodes = []
        self.display_name = self.unique_name.split("|")[-1]

    def child_count(self):
        return len(self.child_nodes)

    def child(self, row):
        if len(self.child_nodes) > 0:
            return self.child_nodes[row]
        return None

    def index_in_parents_children_list(self):
        if self.parent_node is not None:
            return self.parent_node.child_nodes.index(self)


class Selection_Tree_Model(QtCore.QAbstractItemModel):

    def __init__(self, items_flat_dict):
        self.items_flat_dict = items_flat_dict
        # self.headers = list(items[self.key_for_row(0)].keys())
        super().__init__()

        self.root_node = Node({})
        self.nodes = self.create_nodes_from_dictionary(self.items_flat_dict)
        self.set_node_hierarchy(self.nodes)
        # print([_node.display_name for _node in self.root_node.child_nodes])
        # print([_n.display_name for _n in _node.children])
        # print(self.get_node_for_display_name("persp").parent_node.display_name )

    def create_nodes_from_dictionary(self, dictionary):
        """
        Given a flat dictionary will create node objects from it

        Parameters
        ----------
        dictionary

        Returns
        -------

        """
        _nodes = []
        for item_key in list(dictionary.keys()):
            _item_dictionary = dictionary[item_key]
            _node = Node(_item_dictionary)
            _nodes.append(_node)

        return _nodes

    def set_node_hierarchy(self, node_list):
        """
        Iterates through the node list and sets the children and parent nodes for each
        Parameters
        ----------
        node_list

        Returns
        -------

        """
        for _node in node_list:
            _node_children = _node.children
            if _node.parent is None:
                _node.parent_node = self.root_node
                self.root_node.child_nodes.append(_node)

            if _node_children is None:
                continue

            for _child in _node_children:
                _child_node = self.get_node_for_display_name(_child)
                _child_node.parent_node = _node
                _node.child_nodes.append(_child_node)
        return

    def get_node_for_display_name(self, display_name):
        for _node in self.nodes:
            if _node.unique_name == display_name:
                _node = _node
                return _node

    def header_for_column(self, column):
        if self.columnCount() > 0:
            logger.debug(f'Getting header title for column: {column}')
            try:
                if column == 0:
                    _title = "Name"
                if column == 1:
                    _title = "Animation Range"

                _header_title = _title

                logger.debug(f'Successfully got header title: {_header_title}')

                return _header_title
            except Exception as e:
                logger.warning(f'Encountered exception while attempting to get header title. Returning "null"')
                logger.exception(e)
                return "null"

    def data_for_column_and_row(self, row, column):
        logger.debug(f'Called to get data at row: {row}, column: {column}')
        try:
            _key_for_row = self.key_for_row(row)
            _dict_for_row = self.item_data_dict[_key_for_row]
            _dict_key_list = list(_dict_for_row.values())
            _data = _dict_key_list[column]
            logger.debug(f'Successfully got data: {_data}')
            return _data
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to get data. Returning "null"')
            logger.exception(e)
            return "null"

    def rowCount(self, parent=None, *args, **kwargs):
        """
        The amount of rows in the model

        Parameters
        ----------
        parent : QModelIndex
            Parent index
        args :
        kwargs :

        Returns
        -------
        int
            The amount of rows

        """
        if parent.isValid() is False:
            _node = self.root_node
        else:
            _node = parent.internalPointer()
        return _node.child_count()

    def columnCount(self, parent=None, *args, **kwargs):
        """
        Column amount is based on the amount of data given in the dict for each project

        Parameters
        ----------
        parent : QtCore.QModelIndex
            The parent model index -- not applicable in a table model
        args :
        kwargs :

        Returns
        -------
        int
            The amount of columns

        """
        return 1

    def data(self, index, role=None):
        """
        Returns the data for the given index and role

        Parameters
        ----------
        index : QtCore.QModelIndex
            The index to get data for
        role : QtCore.Qt.Role
            The role to get data for

        Returns
        -------
        object
            The data for the given row and role

        """
        logger.debug(f'Data method called with parameters: {index, role}')
        if role == QtCore.Qt.DisplayRole:
            _node = index.internalPointer()
            if _node != self.root_node:
                if index.column() == 0:
                    return _node.display_name
                if index.column() == 1:
                    return _node.animation_range

        if role == QtCore.Qt.EditRole:
            _node = index.internalPointer()
            if _node != self.root_node:
                if index.column() == 0:
                    return _node.unique_name

        return None

    def parent(self, index):
        if index.isValid() is False:
            return QtCore.QModelIndex()
        _node =index.internalPointer()
        _parent_node = _node.parent_node

        if _node == self.root_node:
            return QtCore.QModelIndex()

        if _parent_node == self.root_node:
            return QtCore.QModelIndex()
        else:
            return self.createIndex(_parent_node.index_in_parents_children_list(), index.column(), _parent_node)
        return QtCore.QModelIndex()

    def index(self, row, column, parent=None, *args, **kwargs):
        if self.hasIndex(row, column, parent) is False:
            return QtCore.QModelIndex()

        if parent.isValid() is False:
            _parent = QtCore.QModelIndex()
            _parent_node = self.root_node
        else:
            _parent = parent.internalPointer()
            _parent_node = parent.internalPointer()

        _node = _parent_node.child_nodes[row]
        if _node is not None:
            return self.createIndex(row, column, _node)
        return QtCore.QModelIndex()

    def headerData(self, section, orientation, role=None):
        """
        Returns the header data for the given index and role

        Parameters
        ----------
        section : int
            The index to get header data for.
        orientation : QtCore.Qt.Orientation
            The orientation of the header to get data for.
        role : QtCore.Qt.Role
            The role to get header data for.

        Returns
        -------
        object
            The header data for the given header index and row

        """
        if role != QtCore.Qt.DisplayRole or orientation == QtCore.Qt.Vertical:
            return None
        else:
            if section >= self.columnCount():
                return None
            else:
                _text = self.header_for_column(section)
            return _text


class FileNode:

    def __init__(self, filepath, display_name, display_icon):
        self._filepath       = filepath
        self._display_name   = display_name
        self._parent_node    = None
        self._child_nodes    = []
        self._display_icon   = display_icon

    @property
    def filepath(self):
        return self._filepath

    @property
    def display_name(self):
        return self._display_name

    @property
    def parent_node(self):
        return self._parent_node

    @property
    def child_nodes(self):
        return self._child_nodes

    @property
    def display_icon(self):
        return self._display_icon

    def add_child_node(self, node):
        self._child_nodes.append(node)
        node.set_parent_node(self)

    def set_parent_node(self, node):
        self._parent_node = node



    def child_count(self):
        """

        Returns
        -------
        int

        """
        return len(self.child_nodes)

    def get_child(self, row):
        """

        Parameters
        ----------
        row : int

        Returns
        -------
        FileNode or None

        """
        if len(self.child_nodes) == 0:
            return
        return self.child_nodes[row]

    def index_in_parents_child_list(self):
        """

        Returns
        -------
        int

        """
        if self.parent_node is not None:
            return self.parent_node.child_nodes.index(self)

class BaseDictTreeModel(QtCore.QAbstractItemModel):

    def __init__(self, item_dict, node_type=None, keys_to_exclude=None, *args, **kwargs):
        """

        Parameters
        ----------
        item_dict: dict

        """
        super().__init__(*args, **kwargs)
        if not node_type:
            node_type = FileNode
        if not keys_to_exclude:
            keys_to_exclude = []

        self.node_type = node_type
        self.keys_to_exclude = keys_to_exclude

        self.item_dict = item_dict
        self.nodes = self.generate_nodes_from_dict(self.item_dict)

    @property
    def root_node(self):
        if len(self.nodes) == 0:
            return
        return self.nodes[0]

    def generate_nodes_from_dict(self, dictionary, parent_node=None, node_list=None):
        """
        Given a flat dictionary will create node objects from it

        Parameters
        ----------
        dictionary
        parent_node : self.node_type

        Returns
        -------

        """
        if not node_list:
            node_list = []
        for key, value in dictionary.items():
            if key in self.keys_to_exclude:
                continue

            node = self.create_node(key, value, self.node_type)
            node_list.append(node)
            if parent_node:
                parent_node.add_child_node(node)
            if isinstance(value, dict):
                _valid_keys = [key for key in value if key not in self.keys_to_exclude]
                if len(_valid_keys) == 0:
                    continue
                _child_nodes = self.generate_nodes_from_dict(dictionary=value, parent_node=node, node_list=node_list)
                continue
        return node_list

    def create_node(self, key, value, node_type):
        """
        Creates a node of the given type using the given key and value

        Parameters
        ----------
        key
        value
        node_type

        Returns
        -------

        """
        raise NotImplementedError(f"Must implement 'create_node'.")

    def get_node_for_display_name(self, display_name):
        for _node in self.nodes:
            if _node.display_name == display_name:
                return _node

    def header_for_column(self, column):
        return ''

    def data_for_column_and_row(self, row, column):
        logger.debug(f'Called to get data at row: {row}, column: {column}')
        try:
            _key_for_row = self.key_for_row(row)
            _dict_for_row = self.item_data_dict[_key_for_row]
            _dict_key_list = list(_dict_for_row.values())
            _data = _dict_key_list[column]
            logger.debug(f'Successfully got data: {_data}')
            return _data
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to get data. Returning "null"')
            logger.exception(e)
            return "null"

    def rowCount(self, parent=None, *args, **kwargs):
        """
        The amount of rows in the model

        Parameters
        ----------
        parent : QModelIndex
            Parent index
        args :
        kwargs :

        Returns
        -------
        int
            The amount of rows

        """
        if parent.isValid() is False:
            _node = self.root_node
        else:
            _node = parent.internalPointer()
        return _node.child_count()

    def columnCount(self, parent=None, *args, **kwargs):
        """
        Column amount is based on the amount of data given in the dict for each project

        Parameters
        ----------
        parent : QtCore.QModelIndex
            The parent model index -- not applicable in a table model
        args :
        kwargs :

        Returns
        -------
        int
            The amount of columns

        """
        return 1

    def data(self, index, role=None):
        """
        Returns the data for the given index and role

        Parameters
        ----------
        index : QtCore.QModelIndex
            The index to get data for
        role : QtCore.Qt.Role
            The role to get data for

        Returns
        -------
        object
            The data for the given row and role

        """
        logger.debug(f'Data method called with parameters: {index, role}')

        node = index.internalPointer()
        if node == self.root_node:
            return

        if role == QtCore.Qt.DisplayRole:
            return node.display_name
        if role == QtCore.Qt.EditRole:
            return node.filepath

        return

    def parent(self, index):
        if not index.isValid():
            return QtCore.QModelIndex()

        node = index.internalPointer()
        if node == self.root_node:
            return QtCore.QModelIndex()

        parent_node = node.parent_node
        if parent_node == self.root_node:
            return QtCore.QModelIndex()

        return self.createIndex(parent_node.index_in_parents_child_list(), index.column(), parent_node)

    def index(self, row, column, parent=None, *args, **kwargs):
        if not self.hasIndex(row, column, parent):
            return QtCore.QModelIndex()

        parent_node = self.root_node
        if parent.isValid():
            parent_node = parent.internalPointer()

        node = parent_node.get_child(row)
        if not node:
            return QtCore.QModelIndex()

        return self.createIndex(row, column, node)


    def headerData(self, section, orientation, role=None):
        """
        Returns the header data for the given index and role

        Parameters
        ----------
        section : int
            The index to get header data for.
        orientation : QtCore.Qt.Orientation
            The orientation of the header to get data for.
        role : QtCore.Qt.Role
            The role to get header data for.

        Returns
        -------
        object
            The header data for the given header index and row

        """
        if role != QtCore.Qt.DisplayRole or orientation == QtCore.Qt.Vertical:
            return None

        if section >= self.columnCount():
            return None
        _text = self.header_for_column(section)
        return _text



class Selection_Table_Model(QtCore.QAbstractItemModel):

    def __init__(self, items):
        self.item_data_dict = items
        super().__init__()

    def key_for_row(self, row):
        """
        For the given row number will return the key
        that represents it in the data dictionary

        Parameters
        ----------
        row : int
            The row to get

        Returns
        -------
        str
            The key representing the given row

        """
        logger.debug(f'Getting dictionary key for row: {row}')
        try:
            data_keys = list(self.item_data_dict.keys())
            _key = data_keys[row]
            logger.debug(f'Got key for row: {_key}')
            return _key
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to get the key for row: {row}')
            logger.exception(e)

    def row_for_key(self, key):
        """
        Gets the row that the given key would take up

        Parameters
        ----------
        key : str
            The key to get the row value for (project name)

        Returns
        -------
        int
            The row number

        """
        _data_keys = list(self.item_data_dict.keys())
        for _row in range(0, self.rowCount()):
            if self.key_for_row(_row) == key:
                return _row

    def header_for_column(self, column):
        if self.columnCount() > 0:
            logger.debug(f'Getting header title for column: {column}')
            try:
                _key_for_first_row = self.key_for_row(0)
                _dict_for_first_row = self.item_data_dict[_key_for_first_row]
                _keys_for_first_row = list(_dict_for_first_row.keys())

                _header_title = _keys_for_first_row[column]

                logger.debug(f'Successfully got header title: {_header_title}')

                return _header_title
            except Exception as e:
                logger.warning(f'Encountered exception while attempting to get header title. Returning "null"')
                logger.exception(e)
                return "null"


    def data_for_column_and_row(self, row, column):
        logger.debug(f'Called to get data at row: {row}, column: {column}')
        try:
            _key_for_row = self.key_for_row(row)
            _dict_for_row = self.item_data_dict[_key_for_row]
            _dict_key_list = list(_dict_for_row.values())
            _data = _dict_key_list[column]
            logger.debug(f'Successfully got data: {_data}')
            return _data
        except Exception as e:
            logger.warning(f'Encountered exception while attempting to get data. Returning "null"')
            logger.exception(e)
            return "null"

    def rowCount(self, parent=None, *args, **kwargs):
        """
        The amount of rows in the model

        Parameters
        ----------
        parent : QModelIndex
            Parent index
        args :
        kwargs :

        Returns
        -------
        int
            The amount of rows

        """
        return len(list(self.item_data_dict.keys()))

    def columnCount(self, parent=None, *args, **kwargs):
        """
        Column amount is based on the amount of data given in the dict for each project

        Parameters
        ----------
        parent : QtCore.QModelIndex
            The parent model index -- not applicable in a table model
        args :
        kwargs :

        Returns
        -------
        int
            The amount of columns

        """
        _key_for_first_row = self.key_for_row(0)
        _dict_for_first_row = self.item_data_dict[_key_for_first_row]
        return len(_dict_for_first_row)

    def data(self, index, role=None):
        """
        Returns the data for the given index and role

        Parameters
        ----------
        index : QtCore.QModelIndex
            The index to get data for
        role : QtCore.Qt.Role
            The role to get data for

        Returns
        -------
        object
            The data for the given row and role

        """
        logger.debug(f'Data method called with parameters: {index, role}')
        if role == QtCore.Qt.DisplayRole:
            _row = index.row()
            _column = index.column()

            logger.debug(f'Getting data for index row: {_row}, column: {_column}')

            _data = self.data_for_column_and_row(_row, _column)

            logger.debug(f'Data is: {_data}')

            return _data

        else:
            return None

    def parent(self, index):
        return QtCore.QModelIndex()

    def index(self, row, column, parent=None, *args, **kwargs):
        return self.createIndex(row, column, parent)

    def headerData(self, section, orientation, role=None):
        """
        Returns the header data for the given index and role

        Parameters
        ----------
        section : int
            The index to get header data for.
        orientation : QtCore.Qt.Orientation
            The orientation of the header to get data for.
        role : QtCore.Qt.Role
            The role to get header data for.

        Returns
        -------
        object
            The header data for the given header index and row

        """
        if role != QtCore.Qt.DisplayRole or orientation == QtCore.Qt.Vertical:
            return None
        else:
            if section >= self.columnCount():
                return None
            else:
                _text = self.header_for_column(section)
            return _text


class Table_Item_Selection_View(QtWidgets.QTableView):

    def __init__(self):
        super().__init__()

class Tree_Item_Selection_View(QtWidgets.QTreeView):
    SelectionChanged = QtCore.Signal(object)


    def __init__(self):
        super().__init__()
        self.cachedIndexSelection = []
        self.setSelectionMode(QtWidgets.QTreeView.ExtendedSelection)

    def setModel(self, model):
        self.cachedIndexSelection = []
        super().setModel(model)

        # self.selectionModel().currentRowChanged.connect(self.row_selection_changed)

    def selectionChanged(self, selected, deselected):
        """
        When selectio nchanges emit necessary data
        Parameters
        ----------
        selected
        deselected

        Returns
        -------

        """

        selected_indexes = selected.indexes()
        deselected_indexes = deselected.indexes()

        if len(selected_indexes) == 0 and len(deselected_indexes) == 0:
            return


        if len(selected_indexes) != 0:
            self.cachedIndexSelection = addItemsToList(
                targetList=self.cachedIndexSelection,
                itemsToAdd=selected_indexes
            )

        if len(deselected_indexes) != 0:
            self.cachedIndexSelection = removeItemsFromList(
                targetList=self.cachedIndexSelection,
                itemsToRemove=deselected_indexes
            )

        _model = self.model()

        selected_items = getDataFromSelectionModelSelection(
            selectionModelIndexes=self.cachedIndexSelection,
            dataModel=_model,
            role=QtCore.Qt.EditRole,
            column=0
        )

        self.SelectionChanged.emit(selected_items)
        super().selectionChanged(selected, deselected)



    def combine_selection_data(self, data):
        # print('data', data)
        # TODO IMPLEMENT THIS AS A WAY TO DEAL WITH THE DATA MODEL DATA QWUERIED FROM MULTIPLE ITEM SELECTIONS
        raise NotImplementedError(f'Must reimplement {self.__class__.__name__}.combine_selection_data() to support multiple selection')

    def current_selection(self):
        _model = self.model()

        _current_index = self.selectionModel().currentIndex()
        _selection = _model.data(_model.index( _current_index.row(), 0, _model.parent(_current_index)), role=QtCore.Qt.DisplayRole)
        return _selection


if __name__ == "__main__":
    import sys
    from animation_exporter.source.utility_resources import settings

    _data = settings.read_json(r"Q:\__packages\_GitHub\animation_exporter\animation_exporter_interface\test\tree_model_dict.json")


    _app = QtWidgets.QApplication(sys.argv)
    _model = Selection_Tree_Model(
        _data
    )
    _view = Tree_Item_Selection_View()
    #
    _view.setModel(_model)

    # _win = base_windows.Main_Window()
    # _win.setCentralWidget(_view)
    _view.show()

    sys.exit(_app.exec_())
