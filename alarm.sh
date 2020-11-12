#!/usr/bin/env sh

soundfile=$HOME/music/stuka.m4a

if [[ "$@" == "" ]]
then
    sleep 8h
else
    sleep $@
fi
mpv --audio-display=no --loop=inf --volume=300 $soundfile
