#!/usr/bin/env sh

#xrandr --auto
#xrandr --output VGA-0 --off
#xrandr --output LVDS-1-1 --primary 
if mons | grep -q HDMI; then
	mons -S '0,2:R'
else
	mons -S '0,1:R'
fi
feh --bg-fill $(<~/.cache/wal/wal)
~/project/scripts/bar.sh
