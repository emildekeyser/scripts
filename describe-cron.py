#!/bin/python

import cron_descriptor
import fileinput

for line in fileinput.input():
    line = line.strip("\n")
    try:
        print(cron_descriptor.get_description(line))
    except Exception as e:
        print(e)

