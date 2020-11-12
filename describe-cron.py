#!/bin/python

import cron_descriptor
import sys

try:
    args = " ".join(sys.argv[1:])
    print(cron_descriptor.get_description(args))
except Exception as e:
    print(e)
