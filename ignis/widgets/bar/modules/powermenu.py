# import ignis libraries
from ignis.app import IgnisApp
from ignis.widgets import Widget # main widget library
from ignis.utils import Utils # ignis utilities

def Clock() -> Widget.Label:
    # poll for current time every second
    return Widget.Label(
        css_classes = ["timedate-clock-widget"],
        label = Utils.Poll(
            1_000, lambda self: datetime.datetime.now().strftime("%H:%M")
        ).bind("output"),
    )

def Calendar() -> Widget.Calendar:
    return Widget.Calendar(
        css_classes = ["timedate-calendar-widget"],
        show_day_names = True,
        show_heading = True,
        show_week_numbers = True
    )

def CalendarWindow() -> Widget.RegularWindow:
    return Widget.RegularWindow(
        css_classes = ["unset"],
        namespace = "calendar-window",
        layer = "top",
        kb_mode = "on_demand",
        popup = True,
        monitor = 1,
        child = [Calendar()]
    )

def CalendarButton() -> Widget.Button:
    return Widget.Button(
        child = Widget.Label(label="X"),
        on_click=lambda x: CalendarWindow.popup() 
    )

# define timedate main widget
class Timedate(Widget.Box):
    __gtype_name__ = "Timedate" # gtk name
    
    # define function
    def __init__(self):
        super().__init__(
            css_classes = ["timedate-container"],
            child = [Widget.Box(
                css_classes = ["timedate-clock-container"],
                child=[
                    Clock(),
                ],
            )]
        )




