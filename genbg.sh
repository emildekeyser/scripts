#!/usr/bin/env sh

convert -size 1920x1080 \
  -gravity Center \
  -weight 700 \
  -background lightblue -fill blue \
  -pointsize 200 -font fixed label:"aᛃ" \
  bg.png

# -annotate 0 "ᛃ" \
