#!/bin/bash

[ $# == 0 ] && echo common or unique ?

[[ "$@" == *"common"* ]] && \
    borg create \
        --show-rc \
        --progress \
        --compression auto,zstd,22 /data/backup::'common-{now}'  \
        $HOME/doc \
        $HOME/pic \
        $HOME/project \
        $HOME/tmp \
        $HOME/vid \
        $HOME/ucll \
        $HOME/music/fl \
        $HOME/music/radio \
        $HOME/music/stuka.m4a \
        $HOME/.android \
        $HOME/.ssh \
        $HOME/.mbsyncrc \
        $HOME/.zprofile \
        $HOME/.zshenv \
        $HOME/.zshrc \
        $HOME/.local/templates \
        $HOME/.local/bookmarks \
        $HOME/.local/bin \
        $HOME/.local/history \
        $HOME/.local/all-email-addresses.txt \
        $HOME/.local/pkglist \
        $HOME/.local/zr \
        $HOME/.local/index.html \
        $HOME/.local/people \
        $HOME/.local/calendars \
        $HOME/.local/share/applications \
        $HOME/.local/share/password-store \
        $HOME/.local/share/mail \
        $HOME/.local/share/zathura \
        $HOME/.local/share/newsboat \
        $HOME/.local/share/khal \
        $HOME/.local/share/gnupg \
        $HOME/.local/share/marble \
        $HOME/.local/share/mpd \
        $HOME/.local/share/abook-addressbook \
        $HOME/.local/share/keyrings \
        $HOME/.config/marblerc \
        $HOME/.config/Android\ Open\ Source\ Project \
        $HOME/.config/obs-studio \
        $HOME/.config/aria2 \
        $HOME/.config/godot \
        $HOME/.config/vdirsyncer \
        $HOME/.config/dunst \
        $HOME/.config/mutt \
        $HOME/.config/QtProject.conf \
        $HOME/.config/ccache.config \
        $HOME/.config/bitlbee \
        $HOME/.config/htop \
        $HOME/.config/arandr-layout.sh \
        $HOME/.config/ranger \
        $HOME/.config/msmtp \
        $HOME/.config/GIMP \
        $HOME/.config/hub \
        $HOME/.config/procps \
        $HOME/.config/polybar \
        $HOME/.config/sqliterc \
        $HOME/.config/mpv \
        $HOME/.config/eduroam.cert \
        $HOME/.config/notmuch-config \
        $HOME/.config/lf \
        $HOME/.config/irssi \
        $HOME/.config/erl_observer \
        $HOME/.config/gtk-3.0 \
        $HOME/.config/dconf \
        $HOME/.config/VirtualBox \
        $HOME/.config/iex.exs \
        $HOME/.config/nvim \
        $HOME/.config/matrix-commander \
        $HOME/.config/i3 \
        $HOME/.config/user-dirs.dirs \
        $HOME/.config/psql \
        $HOME/.config/zathura \
        $HOME/.config/firejail \
        $HOME/.config/newsboat \
        $HOME/.config/chromium \
        $HOME/.config/QtProject \
        $HOME/.config/pythonstartup.py \
        $HOME/.config/asciinema \
        $HOME/.config/beets \
        $HOME/.config/pavucontrol.ini \
        $HOME/.config/autostart \
        $HOME/.config/wal \
        $HOME/.config/configstore \
        $HOME/.config/compton.conf \
        $HOME/.config/libreoffice \
        $HOME/.config/pulse \
        $HOME/.config/yabar \
        $HOME/.config/khal \
        $HOME/.config/khard \
        $HOME/.config/clojure \
        $HOME/.config/gtk-2.0 \
        $HOME/.config/elinks \
        $HOME/.config/wpa_supplicant.eduroam.conf \
        $HOME/.config/yay \
        $HOME/.config/git \
        $HOME/.config/artools \
        $HOME/.config/kde.org \
        $HOME/.config/wireshark \
        $HOME/.config/onionshare \
        $HOME/.config/zsh \
        $HOME/.config/menus \
        $HOME/.config/pacman \
        $HOME/.config/mpd \
        $HOME/.config/qt5ct \
        $HOME/.config/oomox \
        $HOME/.config/inkscape \
        $HOME/.config/ncmpcpp \
        $HOME/.config/inputrc \
        $HOME/.config/mimeapps.list \
        $HOME/.config/mps-youtube \
        $HOME/.config/borg \
        $HOME/.config/wgetrc \
        $HOME/.config/X \
        $HOME/.config/weechat \
    && \
    borg prune                          \
        --list                          \
        --prefix 'common-'          \
        --show-rc                       \
        --keep-daily    7               \
        --keep-weekly   4               \
        --keep-monthly  6               \
        /data/backup


[[ "$@" == *"unique"* ]] && \
    borg create \
        --show-rc \
        --progress \
        --compression auto,zstd,22 /data/backup::'{hostname}-{now}' \
        $HOME/.local/log \
        $HOME/.local/unison \
        $HOME/.local/share/matrix-commander \
        $HOME/.local/share/Trash \
        $HOME/.local/share/TelegramDesktop \
        $HOME/.local/share/diana.session \
        $HOME/.local/weechat-matrix \
        $HOME/.config/BraveSoftware \
        $HOME/.config/Skype \
        $HOME/.config/Microsoft \
        $HOME/.config/teams \
        $HOME/.config/tox \
        $HOME/.config/skypeforlinux \
    && \
    borg prune                          \
        --list                          \
        --prefix '{hostname}-'          \
        --show-rc                       \
        --keep-daily    7               \
        --keep-weekly   4               \
        --keep-monthly  6               \
        /data/backup
