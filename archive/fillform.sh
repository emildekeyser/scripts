#!/usr/bin/env sh

# notify-send fillform
printf "hello world\t" | xdotool getactivewindow windowactivate --sync sleep 0.25 type --clearmodifiers --file -
