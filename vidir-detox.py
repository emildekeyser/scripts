#!/bin/python

import fileinput
import re
import os
import subprocess

# alias
detoxrc = os.path.expanduser("~/.config/detox/detoxrc")
cmd = ["inline-detox", "-f", detoxrc, "-s", "inline"]

if __name__ == '__main__':
    regex = re.compile(r"^([0-9]+\s+)(.*)")
    for line in fileinput.input():
        match = regex.match(line)
        prefix = match.group(1)
        suffix = match.group(2) + "\n" # needed for detox
        out = subprocess \
            .run(cmd, input=suffix, text=True, capture_output=True) \
            .stdout
        print(prefix + out.strip())
