#! /bin/bash
source_path="/backup/"
target_path="alpha:/backup"

cd `dirname "${BASH_SOURCE[0]}"`

(
    flock -x -n 200 || exit 1

	./mysql_full_dump.sh 2>/dev/null

	echo
	echo start rsync
	rsync --temp-dir=/tmp --min-size=10 --partial -vzrtopg -e ssh $source_path $target_path

) 200>/tmp/soulogic_rsync_alpha.lock
