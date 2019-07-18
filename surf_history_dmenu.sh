#!/usr/bin/env sh

tac ~/.local/surf/history | dmenu -l 10 -i | cut -d ' ' -f 3
