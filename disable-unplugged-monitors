#!/usr/bin/bash

for monitor in $(xrandr | grep disconnected | awk '{print $1}')
do
	xrandr --output $monitor --off
done
