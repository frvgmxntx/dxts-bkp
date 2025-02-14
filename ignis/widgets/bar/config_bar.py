# import ignis libraries
from ignis.widgets import Widget # main widget library

# import modules
#from .modules.corners import Corners
from .modules.workspaces import Workspaces # workspace module
from .modules.corners import CornerL, CornerR # central corners

# define Bar class
class Bar(Widget.Window): # bar is just another window
    __gtype_name__ = "Bar" # gtk namespace

    # define bar function
    def __init__(self, monitor: int): # static typing check Ruff linter
        super().__init__( # inherit parent class attributes
            # bar properties
            anchor = ["left", "top", "right"], # anchor on top screen
            exclusivity = "exclusive", # tell hyprland to fuck off
            monitor = monitor, # to start on each monitor
            namespace = f"ignis_BAR_{monitor}", # namespace
            layer = "top", # on top of other stuff
            kb_mode = "none", # no keyboard focus allowed
            css_classes = ["unset"],
            # bar modules
            child = Widget.CenterBox(
                css_classes = ["bar-main"], # main bar css class
                # left
                start_widget = Widget.Box(child = 
                [
                    CornerR()
                ]),
                # middle
                center_widget = Widget.Box(child = 
                [
                    CornerL(),
                    Workspaces(),
                    CornerR(), 
                ]),
                # right
                end_widget = Widget.Box(child = 
                [
                    CornerL()
                    
                ]),

            )
            


        )
