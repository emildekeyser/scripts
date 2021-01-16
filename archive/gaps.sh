#!/usr/bin/env sh

if [[ $1 == "increase" ]]; then
	i3-msg gaps inner all plus 5
	$HOME/scripts/polybarcontroller.py increase
elif [[ $1 == "decrease" ]]; then
	i3-msg gaps inner all minus 5
	$HOME/scripts/polybarcontroller.py decrease
elif [[ $1 == "default" ]]; then
	i3-msg gaps inner all set 30
	$HOME/scripts/polybarcontroller.py
elif [[ $1 == "zero" ]]; then
	i3-msg gaps inner all set 0
	$HOME/scripts/polybarcontroller.py 0
fi
