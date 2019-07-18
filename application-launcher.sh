#!/usr/bin/env sh 
grep "/usr/share/applications/.*\.desktop" ~/.local/desktoprc | dmenu -l 40 | cut -d'#' -f 3 | xargs dex >/dev/null 2>&1
