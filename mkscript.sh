#!/usr/bin/env sh

if [[ $# -eq 0 ]]
then
    echo "error: provide script name"
    exit
fi

if [[ $1 = --install ]]
then
    shift
    install=$HOME/.local/bin/$1
fi

interpreter='#!/bin/bash'
scriptfile="$HOME/project/scripts/$1.sh"

if [[ -f "$scriptfile" ]]; then
    echo "$scriptfile is an existing file, i'm not overwriting it"
else
    echo "$interpreter" > "$scriptfile"
    chmod +x "$scriptfile"
    if [[ ! -z $install ]] 
    then
        ln -rs $scriptfile $install
    fi
    $EDITOR $scriptfile
fi
