#!/bin/sh

inpipe=/tmp/fzf-dmenu-input-pipe
outpipe=/tmp/fzf-dmenu-output-pipe
rm -f $inpipe $outpipe
mkfifo $inpipe $outpipe

urxvt -title floating-terminal -e sh -c "fzf < $inpipe > $outpipe" &
while read l ; do
    echo $l > $inpipe
done

cat $outpipe
