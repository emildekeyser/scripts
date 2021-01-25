#!/bin/bash

#RETARDED BULLSHIT:

# inpipe=/tmp/fzf-dmenu-input-pipe
# outpipe=/tmp/fzf-dmenu-output-pipe
# rm -f $inpipe $outpipe
# mkfifo $inpipe $outpipe

# urxvt -title floating-terminal -e sh -c "fzf < $inpipe > $outpipe" &
# while read l ; do
#     echo $l > $inpipe
# done

# cat $outpipe

exec 2>/dev/null

$TERMINAL "$@" -t floater -e zsh -c "[[ -r ~/.cache/wal/sequences ]] && cat ~/.cache/wal/sequences; fzf < /proc/$$/fd/0 > /proc/$$/fd/1"
