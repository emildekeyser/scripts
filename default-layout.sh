#!/usr/bin/env sh

# names=urxvt-project-todo-container
# names="$names|urxvt-ikhal-container"
# names="$names|urxvt-now-todo-container"
# names="$names|urxvt-ucll-todo-container"
# names="$names|Navigator"
# names="$names|telegram-desktop-bin"
# names="$names|Mail"
# xdotool search --classname "$names" \
#     | xargs -n1 xdotool getwindowpid \
#     | xargs 

setsid i3-msg "workspace org; append_layout $HOME/.config/i3/layout/org.json" &

setsid urxvt -name "urxvt-project-todo-container" -e nvim ~/project/me/todo/project.todo &
setsid urxvt -name "urxvt-ikhal-container" -e ikhal &
setsid urxvt -name "urxvt-now-todo-container" -e nvim ~/project/me/todo/now.todo &
setsid urxvt -name "urxvt-ucll-todo-container" -e nvim ~/ucll/u.todo &

setsid i3-msg "workspace mail; append_layout $HOME/.config/i3/layout/mail.json; workspace 1" &

setsid thunderbird &
setsid telegram-desktop &
setsid firefox 'https://mail.protonmail.com/login' &

