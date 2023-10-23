from PySide2 import QtCore, QtWidgets, QtGui
import os, logging

logger = logging.getLogger(__name__)


class LogFileBroker(QtCore.QObject):
    logHierarchyGenerated = QtCore.Signal(dict)
    logDataRead = QtCore.Signal(str)

    class Keys:
        ItemInfo = "**Info"

        ItemType = "**Type"
        class ItemTypes:
            Directory = "**Directory"
            File = "**File"
        ItemDisplayName = "**DisplayName"

    def __init__(self, log_directory, log_identifying_substring=None, filter_logs=True, exclusions=None):
        """

        Parameters
        ----------
        log_directory: str
            The directory to display logs from
        log_identifying_substring: str
            String used to identify valid log files
        filter_logs: bool
            Whether to filter out non-log files based on given log identifying substring
        exclusions: list[str]
            A list of substrings to mark files and directories to exclude
        """
        self._exclusion = exclusions
        self._filter_logs = filter_logs
        self._log_identifying_substring = log_identifying_substring
        self._log_directory = log_directory
        super().__init__()

    def finish_initialization(self):
        log_hierarchy_dict = self._get_directory_hierarchy()
        self.logHierarchyGenerated.emit(log_hierarchy_dict)

    @property
    def exclusions(self):
        if self._exclusion is None:
            return []
        return self._exclusion

    @exclusions.setter
    def exclusions(self, exclusions):
        self._exclusion = exclusions

    @property
    def filter_logs(self):
        return self._filter_logs

    @filter_logs.setter
    def filter_logs(self, is_filtered):
        self._filter_logs = is_filtered

    @property
    def log_identifying_substring(self):
        if self._log_identifying_substring is None:
            return ""
        return self._log_identifying_substring

    @log_identifying_substring.setter
    def log_identifying_substring(self, substring):
        self._log_identifying_substring = substring

    @property
    def log_directory(self):
        return self._log_directory

    @log_directory.setter
    def log_directory(self, directory):
        self._log_directory = directory


    def is_log(self, filename):
        """
        Checks if the given filename is recognized as a valid log
        Parameters
        ----------
        filename : str
            The file name

        Returns
        -------
        bool
            Whether or not the filename is a valid log

        """
        for string in self.exclusions:
            if string in filename:
                return False

        if self.filter_logs and self.log_identifying_substring not in filename:
            return False


        return True

    def generate_item_info(self, type, display_name):
        info = {
            LogFileBroker.Keys.ItemInfo: {
                LogFileBroker.Keys.ItemType: type,
                LogFileBroker.Keys.ItemDisplayName: display_name
            }
        }
        return info

    def _get_directory_hierarchy(self, log_directory=None):
        """

        Parameters
        ----------
        log_directory : str
            Directory being walked -- Natively used only when running recursively

        Returns
        -------
        dict
            A dictionary holding info on directory contents

        """
        is_top_level = False
        if not log_directory:
            log_directory = self.log_directory
            is_top_level = True

        dir_hierarchy = self.generate_item_info(
            type=LogFileBroker.Keys.ItemTypes.Directory,
            display_name=log_directory.split("\\")[-1]
        )

        dir_contents = os.listdir(log_directory)

        for item_name in dir_contents:
            item_path = os.path.join(log_directory, item_name)

            if os.path.isdir(item_path):
                if not self.is_log(item_name):
                    continue

                dir_hierarchy[item_path] = self._get_directory_hierarchy(item_path)
            if os.path.isfile(item_path):
                if not self.is_log(item_name):
                    continue

                item_info = self.generate_item_info(
                    type=LogFileBroker.Keys.ItemTypes.File,
                    display_name=item_name
                )
                dir_hierarchy[item_path] = item_info

        if is_top_level:
            dir_hierarchy = {log_directory: dir_hierarchy}
        return dir_hierarchy


    @QtCore.Slot()
    def read_log_file(self, log_path):
        if os.path.isdir(log_path):
            logger.debug(f"Log path: ({log_path}) is a directory and cannot be read.")
            return

        with open(log_path, "r") as f:
            data = f.read()

        self.logDataRead.emit(data)


if __name__ == "__main__":
    log_directory = r"Q:\__packages\_GitHub\animation_exporter"
    _obj = LogFileBroker(log_directory)
    print(_obj._get_directory_hierarchy())
