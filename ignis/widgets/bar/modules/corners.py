# import ignis libraries
from ignis.widgets import Widget # main widget library

# define left Corner class
class CornerL(Widget.Box):
    __gtype_name__ = "CornerL" # gtk name
    
    # define function
    def __init__(self):
        super().__init__(
            css_classes = ["corner-l"]
        )


# define right Corner class
class CornerR(Widget.Box):
    __gtype_name__ = "CornerR" # gtk name
    
    # define function
    def __init__(self):
        super().__init__(
            css_classes = ["corner-r"]
        )



