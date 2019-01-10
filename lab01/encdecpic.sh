#!/usr/bin/env bash
# Encrypt and decrypt images in BMP 24 format

if [ $# -ne 4 ]
then
	echo Usage: $0 BMP_image_name operation output_filename password
	echo operation could be e or d, e means encryption, d means decryption
	exit 1
fi

if [ ! -r $1 ]
then
	echo $1 is does not exist
	exit 2
fi

isbmp=$( file $1 )

if [[ ! $isbmp == *"PC bitmap, Windows 3.x format"* ]]
then
	echo $1 should be PC bitmap, Windows 3.x format
	exit 3
fi

head -c 54 $1 > header
tail -c +55 $1 > body

openssl enc -aes-128-ofb -$2 -k "$4" -in body -out nbody

cat header nbody > $3
rm header body nbody
