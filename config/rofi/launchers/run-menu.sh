#!/bin/sh

program="$(rofi -dmenu\
    -no-fixed-num-lines\
    -p 'Ejecutar: '\
    -theme $HOME/.config/rofi/styles/menu-run.rasi & )"
$program &
