
import local_settings_manager, file_management

userSettingsModuleName = "userSettings"



askBeforeQueueDeletionKey = "Ask Before Queue Deletion"
askBeforeExportItemDeletionKey = "Ask Before Export Item Deletion"

settingsToHideKey = "SettingsToHide"
itemViewHiddenAttributesKey = "ItemViewHiddenAttributes"
exportItemsHiddenAttributesKey = "ExportItemsHiddenAttributes"
showHiddenSettingsKey = "ShowHiddenSettings"

mainWindowSizeKey = "MainWindowSize"
settingsWindowSizeKey = "SettingsWindowSize"
queueWindowSizeKey = "QueueWindowSize"

def userSettingsModule():
    _module = local_settings_manager.SettingsForModule(userSettingsModuleName)
    return _module

def settingValue(setting):
    return userSettingsModule().get_setting(setting)


def askBeforeQueueDeletion():
    return settingValue(askBeforeQueueDeletionKey)

def askBeforeExportItemDeletion():
    return settingValue(askBeforeExportItemDeletionKey)

def settingsToHide():
    return settingValue(settingsToHideKey)

def itemViewHiddenAttributes():
    return settingValue(itemViewHiddenAttributesKey)

def exportItemsHiddenAttributes():
    return settingValue(exportItemsHiddenAttributesKey)

def showHiddenSettings():
    return settingValue(showHiddenSettingsKey)

def mainWindowSize():
    return settingValue(mainWindowSizeKey)

def settingsWindowSize():
    return settingValue(settingsWindowSizeKey)

def queueWindowSize():
    return settingValue(queueWindowSizeKey)