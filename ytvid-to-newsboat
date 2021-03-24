#!/bin/bash

ytrss_prefix="https://www.youtube.com/feeds/videos.xml?channel_id="
url="$(xclip -rmlastnl -selection clipboard -out)"
nburls_path="$HOME/.config/newsboat/urls"

function quit(){
    echo $@
    exit
}

[ -z "$url" ] && quit "no url" 
grep -q youtube <<< "$url" || quit "bad url"

youtube-dl --dump-json $url | jq -r '.channel_id, .uploader' | \
(
    read channel_id
    read channel_name
    echo "$ytrss_prefix$channel_id # $channel_name" \
        | tee -a $nburls_path \
        | xargs echo Adding url:
)
