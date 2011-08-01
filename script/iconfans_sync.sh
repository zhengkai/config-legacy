#!/bin/sh
run_file="/tmp/emule_rsync"

echo `date +'%Y-%m-%d %H:%M:%S'` > /tmp/emule_rsync_check

if [ -f $run_file ] 
then 
	echo "\n\teMule rsync 已经在运行\n"
	exit
fi

touch $run_file

echo `date +'%Y-%m-%d %H:%M:%S'` > /tmp/emule_rsync_run

/usr/bin/rsync --temp-dir=/www/tmp --partial -vzrtopg -e "ssh -o TCPKeepAlive=yes -o ServerAliveInterval=30" iconfans:/var/www/iconfans/ /www/iconfans/
/usr/bin/rsync --temp-dir=/www/tmp --partial -vzrtopg -e "ssh -o TCPKeepAlive=yes -o ServerAliveInterval=30" iconfans:/backup/ /www/iconfans_db/

sleep 5

rm -f $run_file

