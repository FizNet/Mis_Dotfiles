#!/bin/bash
# POLKIT
#volumeicon &
#nm-applet &
#xsetroot -cursor_name left_ptr
$HOME/.config/polybar/launch.sh &
numlockx &
feh --bg-fill $HOME/Imágenes/Fondos/Kraken.png &
killall picom ; picom --experimental-backend &
#/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
#eww open bar &

