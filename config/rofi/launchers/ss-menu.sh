#!/bin/sh
theme_path="$HOME/.config/rofi/styles/ss-menu.rasi"
rofi_run="rofi -theme $theme_path"
# Icons /               

screenshoot=' '
area=' '
full=' '
window=''

options="$area\n$full\n$window"
select="$( echo -e $options | $rofi_run -dmenu -selected-row 1 -p "Captura de pantalla" )"
case $select in
	$area)
		scrot -s 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES) ; viewnior $$(xdg-user-dir PICTURES)/$f' &
	;;
	$full)
		sleep 1; scrot 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES) ; viewnior $$(xdg-user-dir PICTURES)/$f' &
	;;
	$window)
		sleep 1; scrot -u 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f $$(xdg-user-dir PICTURES) ; viewnior $$(xdg-user-dir PICTURES)/$f' &
	;; 
esac
