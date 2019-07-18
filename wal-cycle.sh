#!/usr/bin/env sh

## Backends:
# schemer2.py
# wal.py
# haishoku.py
# colorz.py
# colorthief.py

dir=--iterative
be=--backend haishoku.py
light=-l
sat=--saturate 0.4
# theme=-f tempus_fugit
# bg=-b '#DEE8E0'
# nowal=-n

wal $nowal $theme $be $bg $sat $light $dir -i ~/pic/wallpaper/art/pagan/xuSMCSc.png
feh --bg-center pic/wallpaper/art/pagan/xuSMCSc.png


#unfocuesd_opacity=100 #65
#focused_opacity=100 #80
#pkill compton; (compton --opacity-rule=$focused_opacity:'class_g = "URxvt" && focused = 1' --opacity-rule=$unfocuesd_opacity:'class_g = "URxvt" && focused = 0' &)
# This does not work ?
# source ~/.cache/wal/colors.sh && printf "\033]708;$background\a" > /dev/pts/[0-9]*
#~/scripts/write-extra-sequences.py
#sh ~/doc/clone/intellijPywal/intellijPywalGen.sh ~/.IntelliJIdea2018.2/config

