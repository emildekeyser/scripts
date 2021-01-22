#!/bin/python

import fileinput
import argparse
import sys
import re

def unix_friendly_name(name):
    return name.strip() \
        .replace("\t", " ") \
        .replace(" -", "-") \
        .replace("- ", "-") \
        .replace(" ", "-") \
        .replace("&", "and") \
        .replace("|", "pipe") \
        .replace("*", "asterisk") \
        .replace(";", "semicolon") \
        .lower()

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--vidir', action='store_true', help='assume vidir editing session')
    parser.add_argument('files', metavar='INPUTFILE', nargs='*', help='files to read names from, if empty or when -, stdin is used')
    args = parser.parse_args()

    if args.vidir:
        regex = re.compile(r"^([0-9]+\s+)(.*)")
        for line in fileinput.input(args.files):
            match = regex.match(line)
            prefix = match.group(1)
            suffix = match.group(2)
            print(prefix + unix_friendly_name(suffix))
    else:
        for line in fileinput.input(args.files):
            print(unix_friendly_name(line))
