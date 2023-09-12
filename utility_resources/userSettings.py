
import local_settings_manager, file_management

userSettingsModuleName = "userSettings"



askBeforeQueueDeletionKey = "Ask Before Queue Deletion"
askBeforeExportItemDeletionKey = "Ask Before Export Item Deletion"
def userSettingsModule(setting):
    _module = local_settings_manager.SettingsForModule(userSettingsModuleName)
    print(_module.get_setting(setting))
    return _module.get_setting(setting)


def askBeforeQueueDeletion():
    return userSettingsModule(askBeforeQueueDeletionKey )

def askBeforeExportItemDeletion():
    return userSettingsModule(askBeforeExportItemDeletionKey )