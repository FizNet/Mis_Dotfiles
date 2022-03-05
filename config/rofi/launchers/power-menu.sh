#!/bin/sh

# Ruta del tema / theme path
rofi_menu="$HOME/.config/rofi/styles/power-menu.rasi"
rofi_confirm="$HOME/.config/rofi/styles/confirmation.rasi"
# Confirmation Function 
exit_confirm() {
    yes=""
    den=''
    res_select="$(echo -e "$den\n$yes" | rofi\
        -theme $rofi_confirm\
        -dmenu\
        -p "$option: Estas seguro?"\
        -i\
        -selected-now 0 &)"
}

# Option Icons / Names ⏻                
shutdown='⏻'
reboot=''
suspnd=''
lgout=''
lockscreen=''
# Operation of Confirmation
options="$shutdown\n$reboot\n$lockscreen\n$suspnd\n$lgout"
select="$(echo -e "$options" | rofi -theme $rofi_menu -dmenu -p 'Menu de Apagado' -i -selected-row 2 & )"
case $select in
    $shutdown)
        option='Apagar'
        exit_confirm ; res=$res_select
        if [[ $res == $yes ]]; then
            systemctl poweroff &
        elif [[ $res == $den ]]; then
            exit & 
        fi
        ;;
    $reboot)
        option='Reiniciar'
        exit_confirm ; res=$res_select
        if [[ $res == $yes ]]; then
            systemctl reboot &
        elif [[ $res == $den ]]; then
            exit &
        fi
        ;;
    $suspnd)
        systemctl suspend &
        ;;
    $lgout)
        option='Salir'
        exit_confirm ; res=$res_select
        if [[ $res == $yes ]]; then
            bspc quit &
        elif [[ $res == $den ]]; then
            exit &
        fi
        ;;
    $lockscreen)
        echo bloqueo
        ;;
esac
