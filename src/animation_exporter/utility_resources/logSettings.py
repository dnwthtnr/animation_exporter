import datetime
import os, re, platform
import sys

import local_settings_manager

logSettingsModuleName = "logSettings"

loggedModuleName = "animationExporter"

logDirectoryName = "logs"
logFileName = f"{loggedModuleName}_logfile"

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


def get_log_path_from_dir(log_directory):
    """
    Finds the file to log to from the given directory

    Parameters
    ----------
    log_directory: str
        The log directory to find the file to log from

    Returns
    -------
    str or None
        Returns the log directory to log to if present or None

    """

    _lognames = [filename for filename in os.listdir(log_directory) if "logfile" in filename]
    _sorted_lognames = sorted(_lognames)
    if len(_sorted_lognames) == 0:
        return None
    _latest_logname = _sorted_lognames[-1]

    regex = r"(\d\d-\d\d-\d\d)"     # Regex finds any substring composed of 3 sets of 2 digits separated by '-'
    latest_log_date = re.search(regex, _latest_logname, re.MULTILINE)
    if not latest_log_date:
        return

    latest_log_date = latest_log_date.group(0)

    current_date = datetime.datetime.now().strftime("%y-%m-%d")
    if latest_log_date == current_date:
        log_path = os.path.join(log_directory, _latest_logname)
        return log_path


def create_new_log(log_filepath):
    """
    Gathers useful identifying data about the current computer and creates a new log file
    at the given directory with the data appended to it.

    Parameters
    ----------
    log_filepath: str
        Path to create log at

    Returns
    -------

    """
    current_time = datetime.datetime.now().strftime("%y-%m-%d; %H:%M:%S")
    new_text = f"Log file created at {current_time}\nVersion: {sys.version}\nSystem:{platform.system()}, {platform.release()}, {platform.version()}\n"

    with open(log_filepath, "w") as f:
        f.write(new_text)

    return log_filepath


def log_filepath():
    current_log_path = get_log_path_from_dir(log_directory())
    if current_log_path:
        return current_log_path

    current_date = datetime.datetime.now().strftime("%y-%m-%d")

    _new_log_name = f"{logFileName}_{current_date}.txt"
    new_log_path = os.path.join(log_directory(), _new_log_name)

    create_new_log(new_log_path)

    return new_log_path


def insert_log_session_seperator(log_filepath, seperator=None):
    if not seperator:
        seperator = "\n\nNEWSESSION\n\n"

    if not os.path.exists(log_filepath):
        raise FileNotFoundError(f"Given log file: {log_filepath} does not exist.")

    with open(log_filepath, "a") as f:

        f.write(seperator)


