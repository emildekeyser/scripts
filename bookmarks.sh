#!/bin/bash

menu=${1:-fzf}
path=$HOME/.local/bookmarks/unsorted/bookmarks/sorted
url=$(find $path -type f | sed "s:^$path/::" | $menu)
[ ! -z $url ] && brave "$(cat $path/$url)"
