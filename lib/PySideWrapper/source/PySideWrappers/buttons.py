import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

import base_widgets, icons
from PySide2 import QtCore

class ToggleIconButton(base_widgets.Tool_Button):
    enabled = QtCore.Signal()
    disabled = QtCore.Signal()
    toggleStateChanged = QtCore.Signal(bool)


    def __init__(self, enabled_icon, disabled_icon):
        super().__init__()
        self.enabled_icon = enabled_icon
        self.disabled_icon = disabled_icon

        self.setIcon(self.disabled_icon)
        self._enabled = False
        self.clicked.connect(self.toggleIcon)

    @property
    def enabledState(self):
        return self._enabled

    @enabledState.setter
    def enabledState(self, value):
        self._enabled = value

    def toggleIcon(self):
        logger.debug(f'Button {self.__class__.__name__} toggling. Current State: {self.enabledState}')
        if self.enabledState is True:
            self.setIconState(False)
        else:
            self.setIconState(True)

    def setIconState(self, enabled, silent=False):
        if enabled is False:
            self.setIcon(self.disabled_icon)
            self.enabledState = False
            if silent is False:
                self.disabled.emit()
        else:
            self.setIcon(self.enabled_icon)
            self.enabledState = True
            if silent is False:
                self.enabled.emit()

        self.toggleStateChanged.emit(enabled)



class DropdownToggleButton(ToggleIconButton):

    def __init__(self):
        super().__init__(enabled_icon=icons.down_arrow, disabled_icon=icons.up_arrow)

        self.setStyleSheet("background-color: transparent; border: none;")

