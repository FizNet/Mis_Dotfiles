#!/bin/sh

theme_path="$HOME/.config/rofi_menu/styles/apps-menu.rasi"
rofi -modi 'drun'\
	-show drun\
	-theme $theme_path &

