import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

import json
import os.path
import local_settings_manager, file_management
from functools import partial
from PySide2 import QtCore, QtWidgets
from animation_exporter.utility_resources import settings


class SettingsController(QtCore.QObject):

    settingsDictionary = QtCore.Signal(dict)
    closeSettings = QtCore.Signal()

    _settingsModule = None
    def __init__(self, module):
        super().__init__()
        self.setSettingsModule(module)


    def settingsModule(self):
        return self._settingsModule

    def setSettingsModule(self, module):
        self._settingsModule = local_settings_manager.SettingsForModule(module_name=module)
        print(self.settingsModule().settings_dictionary())


    def setSettingValue(self, setting, value):
        """
        Sets teh given setting to the value
        Parameters
        ----------
        setting
        value

        Returns
        -------

        """
        self.settingsModule().set_setting(setting, value)

    def setSettingDictionary(self, settingDictionary):
        self.settingsModule().overwrite_with_dictionary(settingDictionary)
        print('saving', settingDictionary)

    def emitSettings(self):
        """
        Iteratively emits all settings values

        """
        self.settingsDictionary.emit(self.settingsModule().settings_dictionary())

    def resetSettings(self):
        _default = settings.readDefaultsFile(filename=self.settingsModule().moduleName())
        self.settingsModule().overwrite_with_dictionary(_default)
        self.closeSettings.emit()
