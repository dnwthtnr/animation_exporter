import datetime
import os

import local_settings_manager

logSettingsModuleName = "logSettings"

logDirectoryName = "logs"
logFileName = ""

logLevelKey = "Log-Level"
logDirectoryKey = "LogDirectory"
logSizeMaxKey = "Log-Size-Max"

def logSettingsModule():
    _module = local_settings_manager.SettingsForModule(logSettingsModuleName)
    return _module


def settingValue(setting):
    return logSettingsModule().get_setting(setting)


def logLevel():
    return settingValue(logLevelKey)


def logDirectory():
    return settingValue(logDirectoryKey)


def logSizeMax():
    return settingValue(logSizeMaxKey)


def log_directory():
    directory = logSettingsModule().add_module_subfolder(logDirectoryName)
    return directory


def log_filepath():
    _time = datetime.datetime.now().strftime("[%y-%m-%d_%H.%M.%S]")

    if len(os.listdir(log_directory())) > 0:


    return

