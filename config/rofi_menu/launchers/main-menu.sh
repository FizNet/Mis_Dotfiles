#!/bin/sh
theme_path="$HOME/.config/rofi_menu/styles/main-menu.rasi"
rofi_run="rofi -theme $theme_path"  

ss='  Captura de Pantall'
apps='  Aplicaciones'
volume='  Control de Volume'
blight='  Control de Brillo'
readm='  Modo Lectura'
powermenu='  Menu de Apagado'

options="$apps\n$ss\n$volume\n$blight\n$readm\n$powermenu"
select="$( echo -e "${options}" | $rofi_run -dmenu -i -selected-row 0 -p "Modo Lectura" )"
case $select in
	$on)
		sct 4600 &
	;;
	$off)
		sct 0 &
	;;
esac
