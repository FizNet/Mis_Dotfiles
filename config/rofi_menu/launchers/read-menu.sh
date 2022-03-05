#!/bin/sh
theme_path="$HOME/.config/rofi_menu/styles/read-menu.rasi"
rofi_run="rofi -theme $theme_path" 

on=" Encender"
off=" Apagar"

options="$on\n$off"
select="$( echo -e "${options}" | $rofi_run -dmenu -i -selected-row 0 -p "Modo Lectura" )"
case $select in
	$on)
		sct 4600 &
	;;
	$off)
		sct 0 &
	;;
esac
