#!/usr/bin/env sh 

# grep "/usr/share/applications/.*\.desktop" ~/.local/desktoprc | dmenu -l 40 | cut -d'#' -f 3 | xargs dex >/dev/null 2>&1

dirs="$(sed 's/:/\/applications /g' <<< $XDG_DATA_HOME:$XDG_DATA_DIRS:)"
find $dirs -iname '*\.desktop' 2>/dev/null \
    | dmenu \
    | xargs dex
