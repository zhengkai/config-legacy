#!/bin/bash

# require: imagemagick
# combine gif: convert -delay 10 *.png -resize 200x113 -loop 0 1.gif

# 30	10,16	* * * ~/conf/script/screenshot.sh >/dev/null 2>&1

DISPLAY=:0
export DISPLAY
HOME=/home/zhengkai
export HOME

save_dir=$HOME'/Pictures/shot/'

filename=$save_dir$(/bin/date +'%Y_%m/%d_%H%M%S')'.png'

sleep $[ $RANDOM * 3600 / 32767 ]

mkdir -p `dirname $filename`

import -window root $filename

filesize=`ls -l $filename | awk '{ print $5 }' | tail -1`
if [ $filesize -lt 500 ]; then
	rm $filename
fi
