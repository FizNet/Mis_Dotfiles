#!/bin/sh
theme_path="$HOME/.config/rofi_menu/styles/volume-blight-menu.rasi"
menu_path="$HOME/.config/rofi_menu/launchers/blight-menu.sh"

# Get Brightness value
get_vlight() {
    local bness="$(brightnessctl get)"
    local max="$(brightnessctl max)"
    local perc="$((bness*100/max))"
    blight="$perc"%
}
get_vlight

# Option Icons / Names
down_b='  Bajar Brillo'
up_b='  Subir Brillo'
back='  Volver'

# Operation of Confirmation
options="$back\n$up_b\n$down_b" ; pos_d=0 ; pos="${1:-$pos_d}"
select="$(echo -e "${options}" | rofi -theme $theme_path -dmenu -p "Brillo: $blight" -selected-row $pos & )"
case $select in
    $back)
        $menu_path &
        ;;
    $up_b)
        exit &
        brightnessctl -q s 20+ &
        $menu_path 1 &
        ;;
    $down_b)
        exit &
        brightnessctl -q s 20- &
        $menu_path 2 &
        ;;
esac
