#!/usr/bin/env sh

trash-empty

# push
src=$HOME/
dest=machine2::home/

[[ $1 = pull ]] && src=machine2::home/ && dest=$HOME/ && shift

rsync \
	--archive \
	--delete \
	--human-readable \
    --progress \
	--verbose \
    --log-file=$HOME/.local/log/rsync \
    --include='.config/BraveSoftware/Brave-Browser/Default/Bookmarks' \
	--exclude='.local/log/rsync' \
	--exclude='.local/bin/lf' \
	--exclude='.cache/Xauthority' \
	--exclude='.local/rsync-backups*' \
	--exclude='.cache/yay*' \
	--exclude='.ssh/known_hosts' \
	--exclude='.mozilla*' \
	--exclude='.cache/mozilla*' \
	--exclude='.config/BraveSoftware*' \
	--exclude='.cache/BraveSoftware*' \
	--exclude='.config/Microsoft*' \
	--exclude='.local/share/TelegramDesktop*' \
	--exclude='.config/skypeforlinux*' \
	--exclude='.config/pulse*' \
	--exclude='.cache/mesa_shader_cache*' \
	--exclude='project/vm*' \
	--exclude='.pki*' \
	--exclude='.dbus*' \
	--exclude='.gradle*' \
	--exclude='.java*' \
	--exclude='.emulator_console_auth_token' \
	--exclude='project/pkg/localrepo' \
	--exclude='.config/mutt/.mailsynclastrun' \
	--exclude='torrent' \
	--exclude='.android' \
	--exclude='music/library' \
    "$@" \
    $src \
    $dest

rsync \
	--archive \
	--delete \
	--human-readable \
    --progress \
	--verbose \
    --log-file=$HOME/.local/log/rsync \
    "$@" \
    $src.config/BraveSoftware/Brave-Browser/Default/Bookmarks \
    $dest.config/BraveSoftware/Brave-Browser/Default/Bookmarks


	# --backup-dir=$HOME/.local/rsync-backups \
	# --backup \
