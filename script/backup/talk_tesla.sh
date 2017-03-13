#! /bin/bash
source_path="talk:/backup/"
target_path="/backup/talk_vps"

cd `dirname "${BASH_SOURCE[0]}"`

(
    flock -x -n 200 || exit 1

	echo start rsync
	rsync --temp-dir=/tmp --min-size=10 --partial -vzrtopg -e ssh $source_path $target_path

) 200>/tmp/talk_rsync_tesla.lock
