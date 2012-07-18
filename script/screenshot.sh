#!/bin/bash

sleep $[ $RANDOM * 3600 / 32767 ]

save_dir=$HOME'/Pictures/shot/'

filename=$save_dir$(/bin/date +'%Y_%m/%d_%H%M%S')'.png'

dir=`dirname $filename`

mkdir -p $dir

import -window root $filename

