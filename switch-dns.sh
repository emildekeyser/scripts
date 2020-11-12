#!/bin/bash

confpath=/etc/NetworkManager/NetworkManager.conf

if grep -Pq '^dns=none' $confpath
then
    sudo sed -i 's/dns=none/# dns=none/' $confpath
else
    sudo sed -i 's/# dns=none/dns=none/' $confpath
    echo 'nameserver 127.0.0.1' | sudo tee /etc/resolv.conf
fi

tail -n100 /etc/NetworkManager/NetworkManager.conf /etc/resolv.conf

sudo rc-service NetworkManager restart
