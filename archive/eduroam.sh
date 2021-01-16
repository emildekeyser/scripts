#!/usr/bin/env sh

if sudo iw wlp3s0 scan | grep -q eduroam ; then 
	sudo pkill wpa_supplicant;
	sudo wpa_supplicant -i wlp3s0 -c "$HOME/.config/wpa_supplicant.eduroam.conf" -B;
	sudo dhcpcd wlp3s0;
fi
