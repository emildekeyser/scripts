#!/bin/bash

find $(man -w | tr : ' ') -type f -printf "%f\n" \
	| sort --unique \
	| sed -r 's/(.*)\.(.*)\.gz$/\1 \2/' \
	| fzf \
	| awk '{print "--section=" $2 " " $1}' \
	| xargs -l1 man
