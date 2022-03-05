#!/bin/sh
theme_path="$HOME/.config/rofi/styles/apps-menu.rasi"
rofi -modi "drun"\
	-show drun\
	-theme $theme_path &
