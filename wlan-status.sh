#!/bin/bash

[[ $(hostname) == machine2 ]] && \
    nmcli device status \
    | grep ' connected' \
    | grep -o wlan0
