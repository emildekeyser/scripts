#!/usr/bin/env sh

periode=zomervakantie
url=https://www.kuleuven.be/sport/universitair-sportcentrum/openingsuren/$periode#Zwembad
curl -s "$url" | grep -A9999999999 'id="Zwembad"' | sed '/<\/table>/ q' | w3m -T text/html
