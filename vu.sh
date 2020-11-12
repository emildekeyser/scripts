#!/bin/bash

[ -z "$1" ] && echo 'Provide pkg name' && exit

path=/etc/portage/package.use/package-specific

fullname=$(equery m "$1" \
	| grep Location \
	| tr '/' "\n" \
	| tail -2 \
	| paste - - \
	| tr -s '[:blank:]' '/' \
)

[ -z "$fullname" ] && echo 'Provide existing pkg name' && exit

equery u "$1" \
	| grep -Pv '\+' \
	| sed 's/-//' \
	| xargs echo $fullname \
	| sudo tee -a $path

sudo -e $path
