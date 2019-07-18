#!/usr/bin/env sh

surf $(tail -1 ~/.local/surf/history | cut -d' ' -f3) 
