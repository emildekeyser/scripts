#!/usr/bin/env sh 

dest=/mnt/usb/sync/

rsync -av $HOME/bin $dest
rsync -av $HOME/doc $dest
rsync -av $HOME/music $dest
rsync -av $HOME/project $dest
rsync -av $HOME/scripts $dest
rsync -av $HOME/tmp $dest
rsync -av $HOME/torrent $dest
rsync -av $HOME/pic $dest
rsync -av $HOME/vid $dest
rsync -av $HOME/.config $dest
rsync -av $HOME/.aliases $dest
rsync -av $HOME/.z* $dest
rsync -av $HOME/.histfile $dest
