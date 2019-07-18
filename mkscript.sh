#!/usr/bin/env sh

if [[ $# -eq 0 ]]; then
	echo "give me atleast script name to put in ~/bin/"
	echo "or paths to scripts"
	exit
fi


for script in "$@"; do
	if [[ "$script" =~ "\.py$" ]]; then
		interpreter='#!/usr/bin/env python3'
	else
		interpreter='#!/usr/bin/env sh'
	fi

	if [[ "$script" = *'/'* ]]; then
		scriptfile="$script"
	else
		scriptfile="/home/user1/project/scripts/$script"
	fi

	if [[ -f "$scriptfile" ]]; then
		echo "$scriptfile is an existing file, i'm not overwriting it"
	else
		echo "$interpreter" > "$scriptfile"
		chmod +x "$scriptfile"
	fi
done
