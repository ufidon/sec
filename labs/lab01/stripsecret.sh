#!/usr/bin/env bash
# Encrypt and decrypt images in BMP 24 format

if [ $# -ne 2 ]
then
	echo Usage: $0 BMP_image_namea_with_secrets original_image
	exit 1
fi

if [[ ! -r $1 || ! -r $2 ]]
then
	echo $1 or $2  not exist
	exit 2
fi

isbmp=$( file $1 )

if [[ ! $isbmp == *"PC bitmap, Windows 3.x format"* ]]
then
	echo $1 should be PC bitmap, Windows 3.x format
	exit 3
fi

#x=$( echo  $isbmp | grep -o -E '\w+' )
#y=$( echo $x | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' )
#a=($y)

#echo a0 = ${a[0]}, a2=${a[2]}, a4=${a[4]}


#let "m = (${a[4]} + 1)/2"
#let "h = $m * 2"

#echo m=$m, h=$h

#let "ds = ${a[0]} * ${a[2]} * $h / 8 + 55"
#let "ds = ${a[0]} * ${a[2]} * ${a[4]} / 8 + 55"
#fs=($( wc -c $1 ))

#echo ds is $ds, fs is $fs

os=($( wc -c $2 ))
ss=($( wc -c $1 ))
if [ $ss -le $os ]
then
	echo No secret in the image
	exit 4
fi
let "ds = $os + 1"
tail -c +$ds $1 > secret.txt

