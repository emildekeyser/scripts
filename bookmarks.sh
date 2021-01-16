#!/bin/bash

menu=${@:-dmenu -geometry 150x40}
path=$HOME/.local/bookmarks
url=$(find $path -mindepth 1 | sed "s:^$path/::" | $menu)
[ ! -z "$url" ] && $BROWSER "$(cat $path/$url)"
