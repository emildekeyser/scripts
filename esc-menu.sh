#!/bin/bash

options="lock
reboot
exit wm
reload wm
restart wm
"

if [[ $(hostname) == machine1 ]]
then
    options="shutdown\n$options"
fi

action=$(printf "$options" | dmenu -l 7)
[ -z "$action" ] && exit

case "$action" in
    'shutdown')
        sudo poweroff
    ;;
    'lock')
        # i3lock --show-failed-attempts --color=EEEEEE --image="$LOCKSCREEN_WALLPAPER" --tiling &
        i3lock
    ;;
    'reboot')
        sudo reboot
    ;;
    'exit wm')
        i3 exit
    ;;
    'reload wm')
        i3 reload
    ;;
    'restart wm')
        i3 restart
    ;;
esac
