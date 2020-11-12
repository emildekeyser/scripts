#!/usr/bin/env sh

tmpfile=$(mktemp /tmp/urxvt.XXXXXX)
cat > $tmpfile
urxvt -e nvim -c 'global/^$/delete' -c 'norm G' $tmpfile
