!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpaper"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Pick random wallpaper that's not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

hyprctl hyprpaper reload ,"$WALLPAPER"
sleep 0.2
