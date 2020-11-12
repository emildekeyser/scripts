#!/bin/bash

if [[ $1 = -R ]]
then
    wal -R
    source ~/.cache/wal/colors.sh
    bgs -R -C $color7 ~/.cache/wal/generated.png
    exit
fi

if [[ $1 = -p ]]
then
    theme=$(wal --theme \
        | sed '/Dark Themes/,/Light Themes/ s/ - /dark:/;
            /Light Themes/,/Extra/ s/ - /light:/' \
        | head -n-4 \
        | grep -Pv ':$' \
        | cat - <(printf "random_dark\nrandom_light\n") \
        | fzf \
        | sed 's/dark://'
    )
elif [[ $1 = -l ]]
then
    theme=random_light
else
    theme=random_dark
fi

[ -z $theme ] && exit

if grep -Pq '^light:' <<< $theme
then
    theme=$(sed 's/light://' <<< $theme)
    wal -l --theme $theme
else
    wal --theme $theme
fi

~/project/scripts/pywal-zathura-colors.sh > ~/.cache/wal/colors-zathura

source ~/.cache/wal/colors.sh

sed "s/green/$color7/ ; s/black/$color1/" ~/.config/wal/wallpaper-template.svg \
 | convert - ~/.cache/wal/generated.png

bgs -R -C $color7 ~/.cache/wal/generated.png
