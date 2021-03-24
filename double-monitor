#!/usr/bin/env sh

monitors=$(xrandr | grep ' connected ' | cut -d' ' -f1 | grep -v LVDS1)
[ $(echo $monitors | grep . | wc -l) == 1 ] && \
    xrandr --output $monitors --right-of LVDS1 --auto

bar
