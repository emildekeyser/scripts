#!/usr/bin/env sh

tmpfile=$(mktemp /tmp/urxvt.XXXXXX)
cat > $tmpfile
setsid urxvt -e nvim $tmpfile &
