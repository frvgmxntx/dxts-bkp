# import ignis libraries
from ignis.utils import Utils # utilities functions
from ignis.app import IgnisApp # main app instance and config

# import widgets
from widgets.bar.config_bar import Bar # main bar widget

# define main app
app = IgnisApp.get_default() # start main app instance
app.apply_css(Utils.get_current_dir() + "/globals.scss") # get main scss


# START WIDGETS

# --bar->
for monitor in range(Utils.get_n_monitors()): # for each monitor
    Bar(monitor) # start a bar on it
