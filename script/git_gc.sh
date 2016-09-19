#!/bin/bash

pathList=`locate '.git' | grep -e '\.git$'`

for s in ${pathList[@]}
do
	echo
	date --date='TZ="Asia/Shanghai" now' +'%Y-%m-%d %H:%M:%S'
	echo $s
	echo
	cd $s
	git gc
done
