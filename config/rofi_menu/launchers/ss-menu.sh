#!/bin/sh
theme_path="$HOME/.config/rofi_menu/styles/ss-menu.rasi"
rofi_run="rofi -theme $theme_path"

area="  Seleccionar Area"
full="  Pantalla Completa"
window="  Ventana activa"

options="$area\n$full\n$window"
select="$( echo -e "${options}" | $rofi_run -dmenu -i -selected-row 1 -p "Captura de pantalla" )"
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
