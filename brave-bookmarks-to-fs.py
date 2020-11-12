#!/usr/bin/env python3

import json
import os

bmjson  = os.path.expanduser('~/.config/BraveSoftware/Brave-Browser/Default/Bookmarks')
DIR = os.path.expanduser('~/.local/bookmarks/unsorted/')

def unix_name(s):
    s = ''.join(e for e in s if e.isalnum() or e == ' ')
    s = s.lower()
    s = s.replace(' ', '_')
    return s


def list_children(node, cd):
    if node.get('type') == 'url':
        dn = DIR + cd
        fn = dn + unix_name(node.get('name'))
        u = node.get('url')
        print(fn)
        print("\t-->", u)
        try:
            with open(fn, 'w') as f:
                f.write(u)
        except:
            print('error')
    else:
        cd += unix_name(node.get('name')) + '/'
        dn = DIR + cd
        print('CREATING DIRECTORY:', dn)
        os.makedirs(dn, exist_ok=True)
        for c in node.get('children'):
              list_children(c, cd)

roots = json.load(open(bmjson))['roots']
for rc in roots:
    list_children(roots.get(rc), '')
