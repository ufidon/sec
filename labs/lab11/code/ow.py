#!/usr/bin/env python
# -*- coding: utf-8 -*-
# use Python 3
# Ref: https://samsclass.info/126/proj/PMA402.htm
# Overwrite dstfile with srcfile from offset(in hexdecimal) in dstfile

import os,sys

if len(sys.argv) != 4:
  print("Usage: ow dstfile srcfile offsetinsrc\n")
  exit(1)

offset = int(sys.argv[3], 16)

sf = open(sys.argv[2], 'r+b')
df = open(sys.argv[1], 'r+b')

sb = sf.read()
db = df.read()

if(len(sb) > len(db)-offset):
  print("dst file cannt accommodate src file.\n")
  df.close()
  sf.close()
  exit(2)

cb = db[:offset] + sb + db[offset+len(sb):]

df.seek(0, 0)
df.write(cb)

sf.close()
df.close()
