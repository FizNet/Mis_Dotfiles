#!/bin/sh
theme_path="$HOME/.config/rofi_menu/styles/power-menu.rasi"
confirm_theme="$HOME/.config/rofi_menu/styles/confirmation.rasi"
# Confirmation Function 
exit_confirm() {
    yes="  Si, $option"
    den='  No, Cancelar'
    res_select="$(echo -e "$den\n$yes" | rofi\
        -dmenu\
        -theme $confirm_theme\
        -p "$option: Estas seguro?"\
        -i\
        -selected-now 0 &)"
}

# Option Icons / Names 
shutdown='⏻  Apagar'                ; shutdown_command='echo apagar' #'systemctl poweroff &'
reboot='  Reiniciar'     			; reboot_command='echo reiniciar' #'systemctl reboot &'
suspend='  Suspender'    			; suspend_command='echo suspender' #'systemctl suspend &'
logout='  Cerrar Sesión'           ; logout_command='echo salir' #'bspc quit &'
lockscreen='  Pantalla de Bloqueo' ; lock_command='echo bloquear'

# Operation of Confirmation
options="$lockscreen\n$logout\n$suspend\n$reboot\n$shutdown"
select="$(echo -e "${options}" | rofi -theme $theme_path -dmenu -p 'Menu de Apagado' -i -selected-row 0 & )"
case $select in
    $shutdown)
        option='Apagar'
        exit_confirm ; res=$res_select
        if [[ $res == $yes ]]; then
            $shutdown_command
        elif [[ $res == $den ]]; then
            exit & 
        fi
        ;;
    $reboot)
        option='Reiniciar'
        exit_confirm ; res=$res_select
        if [[ $res == $yes ]]; then
            $reboot_command
        elif [[ $res == $den ]]; then
            exit &
        fi
        ;;
    $suspend)
        	$suspend_command
        ;;
    $logout)
        option='Cerrar Sesión'
        exit_confirm ; res=$res_select
        if [[ $res == $yes ]]; then
            $logout_command
        elif [[ $res == $den ]]; then
            exit &
        fi
        ;;
    $lockscreen)
        $lock_command
        ;;
esac
