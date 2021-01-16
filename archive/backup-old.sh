#!/usr/bin/env sh 

# borg_repo_home=ssh://dinky1/mnt/wd/borg-backups/user1-home
# borg_repo_data=ssh://dinky1/mnt/wd/borg-backups/data
# borg_repo_music=ssh://dinky1/mnt/wd/borg-backups/data-music

borg_repo_home=/mnt/usb/borg-backups/user1-home
borg_repo_data=/mnt/usb/borg-backups/data
borg_repo_music=/mnt/usb/borg-backups/data-music

# export BORG_PASSPHRASE='XYZl0ngandsecurepa_55_phrasea&&123'
export BORG_PASSCOMMAND='pass show borgbackup'

info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

info "Starting backup"

borg create                         \
    --verbose                       \
    --filter AME                    \
    --list                          \
    --stats                         \
    --show-rc                       \
    --compression zstd,11           \
    $borg_repo_home::'{hostname}-{now}'            \
    /home

info "Home backup exit: $?"

borg create                         \
    --verbose                       \
    --filter AME                    \
    --list                          \
    --stats                         \
    --show-rc                       \
    $borg_repo_data::'{hostname}-{now}'            \
    /data/doc                           \
    /data/pic                           \
    /data/vid

info "Data backup exit: $?"

borg create                         \
    --verbose                       \
    --filter AME                    \
    --list                          \
    --stats                         \
    --show-rc                       \
    $borg_repo_music::'{hostname}-{now}'            \
    /data/music 

info "Music backup exit: $?"

# info "Pruning repository"

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machines' archives also:

# borg prune                          \
#     --list                          \
#     --prefix '{hostname}-'          \
#     --show-rc                       \
#     --keep-daily    7               \
#     --keep-weekly   4               \
#     --keep-monthly  6               \

# info "Pruning exit: $?"

# # use highest exit code as global exit code
# # global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))

# if [ ${global_exit} -eq 0 ]; then
#     info "Backup and Prune finished successfully"
# elif [ ${global_exit} -eq 1 ]; then
#     info "Backup and/or Prune finished with warnings"
# else
#     info "Backup and/or Prune finished with errors"
# fi

# exit ${global_exit}
