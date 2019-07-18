#!/usr/bin/env sh

xdotool getactivewindow getwindowpid | xargs pgrep -P | xargs pwdx |  cut -d' '  -f2- | xargs -I§ urxvt -cd "§"
