#!/bin/sh
cd "${HOME}/backup/xingqu/xq.git"
/usr/bin/git remote update
cd "${HOME}/backup/xingqu/doc.git"
/usr/bin/git remote update

name="xingqu"
source_path="garona:~/backup/redmine/"
target_path="${HOME}/backup/xingqu/redmine_db"

run_file="/tmp/${name}_rsync"
check_file="${run_file}_check"
time_file="${run_file}_time"

echo `date +'%Y-%m-%d %H:%M:%S'` > $check_file

if [ -f $run_file ]
then
	echo "\n\t${name} backup 已经在运行\n"
	exit
fi

touch $run_file

echo `date +'%Y-%m-%d %H:%M:%S'` > $time_file

/usr/bin/rsync --temp-dir=/tmp --partial -vzrtopg -e ssh $source_path $target_path

sleep 5

rm -f $run_file

