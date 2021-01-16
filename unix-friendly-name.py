#!/bin/python

import fileinput
import sys
import re

def unix_friendly_name(name):
    name = name.replace("\t", " ") \
        .replace(" -", "-") \
        .replace("- ", "-") \
        .replace(" ", "-") \
        .replace("&", "and") \
        .replace("|", "pipe") \
        .replace("*", "asterisk") \
        .replace(";", "semicolon")
    return name.lower()

if len(sys.argv) > 1 and sys.argv[1] == "-d":
    regex = re.compile(r"^([0-9]+\s+)(.*)")
    for line in fileinput.input(sys.argv[2:]):
        match = regex.match(line)
        prefix = match.group(1)
        suffix = match.group(2)
        print(prefix + unix_friendly_name(suffix))
else:
    for line in fileinput.input():
        line = line.strip("\n")
        print(unix_friendly_name(line))
