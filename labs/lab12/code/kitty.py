#!/usr/bin/env python
# -*- coding: utf-8 -*-
# use Python 3
# Ref: https://samsclass.info/126/proj/PMA132.htm
# Crack stage 2 of MemeCat

def decrypt(cipher):
  plain=''
  for c in cipher:
          plain += chr(ord(c) ^ ord('A'))
  print(plain)

# got with ILSpy on MemeCat
cipher = ['\u0003',' ','&','$','-','\u001e','\u0002',' ','/','/','.','/']

decrypt(cipher)
# Bagel_Cannon/Kitteh_save_galixy@flare-on.com

