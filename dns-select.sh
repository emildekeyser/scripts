#!/bin/bash

resolv=/etc/resolv.conf
confpath=/etc/NetworkManager/conf.d/dns.conf
options="isp\nopennic-dns-over-https\nopennic\n"
cmd=${1:-$(printf $options | fzf)}
cmd=${cmd:-none}

echo "Switching DNS scheme to: $cmd"
sudo rc-service NetworkManager stop

[ "$cmd" = "isp" ] \
	&& echo | sudo tee $confpath

[ "$cmd" = "opennic-dns-over-https" ] \
	&& printf "[main]\ndns=none" | sudo tee $confpath \
	&& echo 'nameserver 127.0.0.1' | sudo tee $resolv

[ "$cmd" = opennic ] \
	&& printf "[main]\ndns=none" | sudo tee $confpath \
	&& sudo opennic-up -f $resolv

sudo rc-service NetworkManager start
tail -n100 $confpath $resolv
