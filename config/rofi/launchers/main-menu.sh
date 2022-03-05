#!/bin/sh
theme_path="$HOME/.config/rofi/styles/main-menu.rasi"
path="$HOME/.config/rofi/launchers"
rofi_run="rofi -theme $theme_path"
# Icons / Names 

ss=''
apps=''
run=''
powermenu=''

options="$powermenu\n$apps\n$run\n$ss"
select="$( echo -e $options | $rofi_run -dmenu -selected-row 1 -i -p "Menu Principal" )"
case $select in
	$ss)
		sh $path/ss-menu.sh
	;;
	$apps)
		sh $path/apps-menu.sh
	;;
	$run)
		sh $path/run-menu.sh
	;;
	$powermenu)
		sh $path/power-menu.sh
	;;
esac
