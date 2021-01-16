#!/bin/bash

GNUPGHOME=/home/user1/.local/share/gnupg
PASSWORD_STORE_DIR=/home/user1/.local/share/password-store
NOTMUCH_CONFIG=/home/user1/.config/notmuch-config
MAILDIR=/home/user1/.local/share/mail

exec > >(tee -a "/home/user1/.local/log/mailsync") 2>&1

echo ===[mbsync]===
mbsync -V -a -c /home/user1/.config/mbsyncrc

echo ===[notmuch]===
notmuch new 2>&1 | grep -v '^Note: Ignoring non-mail file:' 
