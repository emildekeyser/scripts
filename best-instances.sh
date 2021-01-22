#!/bin/bash

mkdir -p ~/.cache/best-instances

curl -s "https://instances.invidio.us/instances.json?sort_by=type,health" \
	| gron \
	| grep uri \
    | sed -E 's|^.* = "https?://||' \
	| sed -E 's|/?";$||' \
    | tee ~/.cache/best-instances/invidious.txt
