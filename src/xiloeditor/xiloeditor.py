from enum import Enum
from typing import Any, Optional, Union

from flet.core.constrained_control import ConstrainedControl
from flet.core.control import OptionalNumber, Ref

from flet.core.types import (
    OffsetValue,
    ResponsiveNumber,
    RotateValue,
    ScaleValue,
)

class EditorTheme(Enum):
    A11Y_DARK = "a11y-dark"
    A11Y_LIGHT = "a11y-light"
    AGATE = "agate"
    ANDROID_STUDIO = "androidstudio"
    ARTA = "arta"
    ASCETIC = "ascetic"
    ATOM_ONE_DARK = "atom-one-dark"
    ATOM_ONE_LIGHT = "atom-one-light"
    DEFAULT = "default"
    DARK = "dark"
    MONOKAI = "monokai"
    MONOKAI_SUBLIME = "monokai-sublime"
    OBSIDIAN = "obsidian"
    VS2015 = "vs2015"
    XCODE = "xcode"

class XiloEditor(ConstrainedControl):
    """
    Xiloeditor Control description.
    """

    def __init__(
        self,
        show_line_numbers: Optional[bool] = True,
        editor_theme: Optional[EditorTheme] = EditorTheme.DEFAULT,
        #
        # Control
        #
        opacity: OptionalNumber = None,
        tooltip: Optional[str] = None,
        visible: Optional[bool] = None,
        data: Any = None,
        #
        # ConstrainedControl
        #
        left: OptionalNumber = None,
        top: OptionalNumber = None,
        right: OptionalNumber = None,
        bottom: OptionalNumber = None,
        ref: Optional[Ref] = None,
        width: OptionalNumber = None,
        height: OptionalNumber = None,
        expand: Union[None, bool, int] = None,
        expand_loose: Optional[bool] = None,
        col: Optional[ResponsiveNumber] = None,
        rotate: Optional[RotateValue] = None,
        scale: Optional[ScaleValue] = None,
        offset: Optional[OffsetValue] = None,
        aspect_ratio: OptionalNumber = None,
        disabled: Optional[bool] = None,
    ):
        ConstrainedControl.__init__(
            self,
            tooltip=tooltip,
            opacity=opacity,
            visible=visible,
            data=data,
            left=left,
            top=top,
            right=right,
            bottom=bottom,
            ref=ref,
            width=width,
            height=height,
            expand=expand,
            expand_loose=expand_loose,
            col=col,
            rotate=rotate,
            scale=scale,
            offset=offset,
            aspect_ratio=aspect_ratio,
            disabled=disabled
        )

        self.show_line_numbers = show_line_numbers
        self.editor_theme = editor_theme

    def _get_control_name(self):
        return "xiloeditor"

    # value
    @property
    def show_line_numbers(self) -> bool:
        return self._get_attr("showLineNumbers")

    @show_line_numbers.setter
    def show_line_numbers(self, show: bool):
        self._set_attr("show_line_numbers", show)
    
    # value
    @property
    def editor_theme(self) -> bool:
        return self._get_attr("editorTheme")

    @editor_theme.setter
    def editor_theme(self, theme: EditorTheme):
        self._set_attr("editorTheme", theme.value)
