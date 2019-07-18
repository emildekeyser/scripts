#!/usr/bin/env sh

soundfile=$HOME/music/stuka.m4a
pause=10m
work=50m

pomodoro()
{
	sleep $@
	notify-send "Pomodoro"
	mpv --audio-display=no --loop=inf --volume=100 $soundfile
}

if [[ "$@" != "" ]]; then
	pomodoro $@
else
	while true ; do
		echo Start work
		date
		pomodoro $work
		let counter++
		echo $counter units of work
		echo start pause
		pomodoro $pause
	done
fi

