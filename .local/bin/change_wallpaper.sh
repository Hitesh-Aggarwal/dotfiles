#!/bin/bash

echo "$1"

ln -sf "$1" "$HOME/.local/share/hyprland/my_wallpaper"

hyprctl hyprpaper reload , "$HOME/.local/share/hyprland/my_wallpaper"
