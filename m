#!/bin/zsh

format="%artist%\t%title%\t%album%\t%genre%\t%time%\t%position%\t%file%"
musicroot="/data/music/library"

histpath="$HOME/.local/history/fzf/playlists"
fzfopts="--history=$histpath"
fzfopts+=" --query='$(tail -1 $histpath 2>/dev/null || echo start of history)'"

case "$1" in
    add)

        mpc --format=%file% \
        | head -1 \
        | xclip -filter -rmlastnl -selection "clipboard" \
        | read song

        mpc lsplaylists \
        | FZF_OPTIONS="$fzfopts" dmenu \
        | read pls

        [[ -z "$pls" ]] || {
            echo "$musicroot/artists/$song" >> "$musicroot/pls/$pls.m3u"
            echo "Added $song to $pls" >> $HOME/.local/log/masterlog
        }

        ;;

	# *)
        # tr "\n" "\0" \
        # | xargs --null \
            # mpc --format="$format" listall \
        # | table-print
        # ;;

	*)
        cd ~/music/library/pls
        nvim -c "call FZFwithhistory()"
        cd -
        ;;

esac
