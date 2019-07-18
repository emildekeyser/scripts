#!/usr/bin/env sh

if [ "$1" = "toggle" ]; then
	flag=/run/user/1000/polbybar-hidden
	# polybar-msg cmd toggle doesn't work with multi-monitor
	if [ -f "$flag" ]; then
		polybar-msg cmd restart
		rm $flag
	else
		polybar-msg cmd hide
		touch $flag
	fi
else
	log=$HOME/.local/log/polybar
	#conf=$HOME/.cache/polybar/config
	conf=$HOME/.config/polybar/config
	args="--config=$conf --reload --log=error"

	pkill polybar
	for m in $(polybar --list-monitors | cut -d":" -f1); do
	    # MONITOR=$m polybar $args invisible-dummy >> $log 2>&1 & 
	    MONITOR=$m polybar $args simple-bar >> $log 2>&1 & 
	done
fi
