#!/bin/sh
run_file="/tmp/iconfans_rsync"

echo `date +'%Y-%m-%d %H:%M:%S'` > /tmp/iconfans_rsync_check

if [ -f $run_file ]
then
	echo "\n\ticonfans rsync 已经在运行\n"
	exit
fi

touch $run_file

echo `date +'%Y-%m-%d %H:%M:%S'` > /tmp/iconfans_rsync_run

#/usr/bin/rsync --bwlimit=200 --temp-dir=/tmp --partial -vzrtopg -e ssh iconfans:/var/www/iconfans/ ~/iconfans/
/usr/bin/rsync --bwlimit=200 --temp-dir=/tmp --partial -vzrtopg -e ssh iconfans:/backup/ /backup/

sleep 5

rm -f $run_file

