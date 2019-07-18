#!/usr/bin/env python
import json, os, glob

cache_dir = os.environ['HOME'] + '/.cache/wal' 
with open(cache_dir + '/colors.json') as json_data:
    colors = json.load(json_data)

tty_pattern = "/dev/pts/[0-9]*"
sequences = "\033]708;" + colors['special']['background'] + "\a"

# Writing to "/dev/pts/[0-9] lets you send data to open terminals.
for term in glob.glob(tty_pattern):
    try:
        with open(term, "w") as file:
            file.write(sequences)
    except PermissionError:
        print(PermissionError)
