#!/usr/bin/env python

import sys
import re
import os

Stats = {}

p_name = re.compile('.*/(\w+)(\.[\-\w]+)?\.out\.time',re.IGNORECASE)

Ids = {}

argv = sys.argv
Normalize = False
Normalize_key = ".None"
if len(argv) > 2:
    if argv[1] == '-N':
        Normalize = True
        Normalize_key = argv[2]

timings = []
cwd = os.getcwd()
for root, dirs, files in os.walk(cwd):
    for f in files:
        if f.endswith('.time'):
            timings.append(os.path.join(root,f))

    
for fName in timings:
    try: 
        f = open(fName,"r")
    except:
        print(("Error: could not find file %s" % fName))
        sys.exit(1)

    m = p_name.match(fName)
    if m==None:
        opt = "-"
        continue
    else:
        g = m.groups()
        if len(g) < 2:
            continue
        name = g[0]
        opt = g[1]
        if opt==None:
            opt = "-"

    Ids[name] = 1
    
    if opt not in Stats:
        Stats[opt] = {}

    if name not in Stats[opt]:
        Stats[opt][name] = 0

    for line in iter(f.readline, ''):
        s = line.split(' ')
        if len(s) != 2:
            continue

        if s[0] == "program":
            Stats[opt][name] = float(s[1])
            break


s = "Category".ljust(20,)
keys = list(Stats.keys())
keys.sort()
for k in keys:
    s += k.rjust(10)

print(s)

benchs = list(Ids.keys())
benchs.sort()

for i in benchs:
    s = str(i).ljust(20,'.')
    for k in keys:
        if i in Stats[k]:
            if Normalize==True and Normalize_key in Stats :
                if Stats['.None'][i] > 0:
                    s += str(Stats[k][i]/Stats[Normalize_key][i])[0:3].rjust(10,'.')
                else:
                    s += str('x').rjust(10,'.');
            else:
                s += str(Stats[k][i]).rjust(10,'.')
        else:
            s += '(missing)'.rjust(10,'.')
    print(s)
