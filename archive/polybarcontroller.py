#!/usr/bin/env python

import configparser, os, argparse, shutil

cache_path = os.environ['HOME'] + '/.cache/polybar/config'
config_path = os.environ['HOME'] + '/.config/polybar/config'
simplebar = "bar/simple-bar"
dummybar = "bar/invisible-dummy"

def main():
    parser = argparse.ArgumentParser()
    # nargs ? to be able to make argless = default
    parser.add_argument('command', default='default', nargs='?')
    args = parser.parse_args()

    if args.command == 'default':
        resetgaps()
    elif args.command == 'increase':
        writegaps(1)
    elif args.command == 'decrease':
        writegaps(-1)
    elif args.command == '0':
        writegaps(0)

def resetgaps():
    shutil.copyfile(config_path, cache_path)

def writegaps(mod):
    config = configparser.RawConfigParser()
    config.read(cache_path)

    # width format: 100%:-30
    width = int(config[simplebar]["width"].split(':')[1])
    offsetx = int(config[simplebar]["offset-x"])
    offsety = int(config[simplebar]["offset-y"])
    dummyheight = int(config[dummybar]["height"])

    width -= 20 * mod 
    offsetx += 5 * mod
    offsety += 5 * mod
    dummyheight += 10 * mod

    width = 0 if width > 0 or mod == 0 else width
    offsetx = 0 if offsetx < 0 or mod == 0 else offsetx
    offsety = 0 if offsety < 0 or mod == 0 else offsety
    dummyheight = 26 if dummyheight < 26 or mod == 0 else dummyheight

    config[simplebar]["width"] = '100%:' + str(width)
    config[simplebar]["offset-x"] = str(offsetx)
    config[simplebar]["offset-y"] = str(offsety)
    config[dummybar]["height"] = str(dummyheight)

    with open(cache_path, 'w') as f:
        config.write(f)


if __name__ == "__main__":
    main()
