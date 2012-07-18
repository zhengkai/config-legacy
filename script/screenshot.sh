#!/bin/bash

# 30	10,16	* * * ~/conf/script/screenshot.sh >/dev/null 2>&1

save_dir=$HOME'/Pictures/shot/'

filename=$save_dir$(/bin/date +'%Y_%m/%d_%H%M%S')'.png'

sleep $[ $RANDOM * 3600 / 32767 ]

mkdir -p `dirname $filename`

import -window root $filename

