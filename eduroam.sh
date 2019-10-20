#!/usr/bin/env sh

# conf="$HOME/.config/wpa_supplicant.eduroam.conf" 
conf="$HOME/.cat_installer/cat_installer.conf"

if sudo iw wlp3s0 scan | grep -q eduroam ; then 
	sudo pkill wpa_supplicant;
	sudo wpa_supplicant -i wlp3s0 -c $conf -B;
	sudo dhcpcd wlp3s0;
fi
