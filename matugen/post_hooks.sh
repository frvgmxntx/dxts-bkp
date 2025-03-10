#!/usr/bin/env bash

# MATUGEN POST HOOKS SINGLE SCRIPT
sleep 0.2
echo -e '---MATUGEN POST HOOK STARTING---'

# [templates.firefox]
pywalfox update &
echo -e '[templates.firefox]'

# [templates.hyprland]
hyprctl reload &
echo -e '[templates.hyprland]'

# [templates.kitty]
killall -SIGUSR1 kitty &
echo -e '[templates.kitty]'

# [templates.mako]
makoctl reload &
echo -e '[templates.mako]'

# [templates.material-gtk-theme-color]

cd /home/frvg/.config/hypr/scripts/materia-theme/src/gtk-3.0

/home/frvg/.config/hypr/scripts/materia-theme/src/gtk-3.0/render-assets.sh && sleep 0.1

cd /home/frvg/.config/hypr/scripts/materia-theme
rm -r _build

meson setup _build -Dprefix="$HOME/.local" -Dcolors=dark -Dsizes=default

meson install -C _build
echo -e '[templates.material-gtk-theme-color]'

# [templates.flatcolor-gtk-icons]
source /home/frvg/.config/hypr/scripts/archdroid-icon-theme/color.sh
cd /home/frvg/.config/hypr/scripts/archdroid-icon-theme/change_color.sh -o archdroid -c "$COLOR" && gtk-update-icon-cache -f -t -i ~/.local/share/icons/archdroid-icon-theme/

theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
gsettings set org.gnome.desktop.interface gtk-theme ''
sleep 0.01
gsettings set org.gnome.desktop.interface gtk-theme $theme

echo -e '[templates.flatcolor-gtk-icons]'

echo -e '---MATUGEN POST HOOK ENDED---'
sleep 0.2


