#!/usr/bin/env sh

ln -sf "$(find "$2" -samefile "$1")" "$1"
