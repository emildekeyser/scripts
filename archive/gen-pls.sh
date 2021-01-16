#!/usr/bin/env sh

artist_root="/data/music/library/artists/" # Symbolic link ! -> needs trailing /
pls_root="/data/music/library/pls"
pls_destination="$HOME/.config/mpd/playlists"

main()
{
	if ! [[ "$1" =~ ^$pls_root ]]; then
		pls_dir="$pls_root/$1"
	else
		pls_dir="$1"
	fi
	if [ -d $pls_dir ]; then
		rm $pls_destination/*
		find $pls_dir -mindepth 1 -maxdepth 1 -type d | dir2m3u
		find $pls_destination -size 0 -delete
		mpc update
	fi
}

dir2m3u()
{
	while read dir ; do
		pls_name="$pls_destination/$(basename $dir).m3u"
		#find $dir -type f > $pls_name
		find $dir -type f | inode_shift > $pls_name
	done
}

inode_shift()
{
	while read wrong_path ; do
		inode=$(stat --printf=%i "$wrong_path")
		correct_path=$(find $artist_root -inum "$inode")
		echo $correct_path
	done
}

main $@
