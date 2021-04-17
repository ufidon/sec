#!/usr/bin/env python
# -*- coding: utf-8 -*-
# use Python 3
# Ref: https://samsclass.info/126/proj/PMA402.htm

import os

# Dump memory

cmd = "del mine.dmp"
os.system(cmd)
cmd = "procdump -ma minesam.exe mine"
os.system(cmd)

# Find gameboard

mark =b'\x00\x10\x10\x10\x10\x10\x10\x10\x10\x10\x10\x10\x0F'

line_length = 32
board_size = 500 # characters in whole board

with open("mine.dmp", "rb") as f:
  data= f.read()

start = data.find(mark)
if start <0:
  print("Gameboard not found")

# Print gameboard
for i in range(0, board_size, line_length):
  line = ''
  for j in range(line_length):
    g = data[start+i+j]
    line +=  '{0:02x}'.format(g)
  print(line)

for i in range(0, board_size, line_length):
  line = ''
  for j in range(line_length):
    g = data[start+i+j]
    if g == int.from_bytes(b'\x10', 'big'):
      c = "-"
    elif g == int.from_bytes(b'\x0f', 'big'):
      c = " "
    elif g == int.from_bytes(b'\x8f', 'big'):
      c = "*"
    elif g == int.from_bytes(b'\x00', 'big'):
      c = " "
    else:
      c = chr(g - 16 )

    line += c
  print(line)