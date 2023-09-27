from . import base_widgets, base_layouts, constants


class ListToolTipDisplay(base_widgets.Label):
    seperator = " :: "

    def __init__(self, _list, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.setList(_list)
        self.setAlignment(constants.align_left)

    def list(self):
        _tooltip_text = self.toolTip()
        _list = _tooltip_text.split(self.seperator)
        return _list

    def setList(self, _list):
        self.setText(f"{len(_list)} Items")
        self.setToolTip("".join(_list))
