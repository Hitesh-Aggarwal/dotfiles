#!/bin/bash

wallpaper="$(fd --type f "" $HOME/Pictures/wallpapers/ | fuzzel -d )"
$HOME/.local/bin/change_wallpaper.sh "$wallpaper"
