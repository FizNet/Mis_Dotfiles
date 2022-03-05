#!/bin/sh
theme_path="$HOME/.config/rofi_menu/styles/volume-blight-menu.rasi"
menu_path="$HOME/.config/rofi_menu/launchers/volume-menu.sh"

# Get Volume 
value="$(pamixer --get-volume-human)"

# Option Icons / Names
mute='  Silenciar'       
down_v='  Bajar Volumen'  
up_v='  Subir Volumen'  
back='  Volver'

# Operation of Confirmation
options="$back\n$up_v\n$mute\n$down_v" ; pos_d=0 ; pos="${1:-$pos_d}"
select="$(echo -e "${options}" | rofi -theme $theme_path -dmenu -p "Volumen: $value" -selected-row $pos & )"
case $select in
    $back)
        $menu_path &
        ;;
    $up_v)
        pamixer -i 5 &
        $menu_path 1 &
        ;;
    $mute)
        pamixer -t &
        $menu_path 2 &
        ;;
    $down_v)
        pamixer -d 5 &
        $menu_path 3 &
        ;;
esac
