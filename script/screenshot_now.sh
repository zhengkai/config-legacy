#!/bin/bash

# 30	10,16	* * * ~/conf/script/screenshot.sh >/dev/null 2>&1

DISPLAY=:0
export DISPLAY
HOME=/home/zhengkai
export HOME

save_dir=$HOME'/Pictures/'

filename=$save_dir$(/bin/date +'%Y_%m_%d_%H%M%S')'.png'

mkdir -p `dirname $filename`

import -window root $filename

filesize=`ls -l $filename | awk '{ print $5 }' | tail -1`
if [ $filesize -lt 400 ]; then
	rm $filename
fi
