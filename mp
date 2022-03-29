#!/usr/bin/env bash

pls=$HOME/.local/mpv/playlist
sock=$HOME/.local/mpv/socket

# TODO

# ffprobe -v quiet -print_format json -show_format  '/data/download/torrent/data/VA - Apnea - Deep Water 2021 [Apnea Label] FLAC-2022/01-Slow Dimension - Hydrolagus Chimera.flac' \
# | jq '.format.tags' \
# | tr '[A-Z]' '[a-z]' \
# | jq '.artist, .track, .title, .album, .genre'

create-m3u(){
    while IFS= read -r -d $'\0' audiofile
    do
        # printf '# '
        # ffprobe "$audiofile" 2>&1 \
        #     | sed -nE 's/^ *(ARTIST|ALBUM|TITLE) *: // p' \
        #     | tr "\n" "-" \
        #     | sed -e 's/-/ - /g' -e 's/ - $//'
        # echo
        echo $audiofile
    done
}


if [[ $1 = m ]] 
then

        # | sed 's/^# //' \
        # | paste - - \
    tail -n+2 $pls \
        | nl --number-width=1 --starting-line-number=0 \
        | fzf --with-nth=2.. \
        | awk '{print "playlist-play-index " $1}' \
        | socat - $sock

elif [[ $1 = e ]]
then
    $EDITOR $pls
elif [[ $1 = p ]]
then
    shift
    source="find $@ -type f"
    test -t 0 || source=cat # if stdin open, use it

    echo Creating new playlist ...

    echo '#EXTM3U' > $pls
    $source \
        | tr "\n" "\0" \
		| xargs --null file --mime-type \
		| sed -nE 's/: *audio\/.*$// p' \
        | tr "\n" "\0" \
		| xargs --null readlink --canonicalize \
		| sort \
        | tr "\n" "\0" \
        | create-m3u \
        >> $pls

    pkill mpv
    mp
else
    pgrep mpv || mpv --audio-display=no --playlist=$pls --input-ipc-server=$sock
fi
