#!/usr/bin/env bash

shopt -s nullglob globstar

typeit=0
if [[ $1 == "--type" ]]; then
	typeit=1
	shift
fi

prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

username=$(printf '%s\n' "${password_files[@]}" | dmenu "$@")

[[ -n $username ]] || exit

if [[ $typeit -eq 0 ]]; then
	pass show "$username" | tail -1 | xclip -rmlastnl -selection clipboard
else
	pass show "$username" | tail -1 | { IFS= read -r pass; printf %s "$pass"; } |
		xdotool type --clearmodifiers --file -
fi
