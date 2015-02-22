#!/bin/bash

dir=$(dirname `readlink -f $0`);

if [ -d "/www/manual/php" ]; then
	$dir/php.manual.sh 2>&1
fi

is_ubuntu=`grep 'Ubuntu ' /etc/issue`
if [ -n "$is_ubuntu" ]; then
	$dir/update_ubuntu.sh 2>&1
fi

checkfile="/usr/local/bin/composer"
if [ -f $checkfile ]; then
	sudo $checkfile  self-update 2>&1
fi

checkdir=(
	/www/kt
	/www/core
	/www/soulogic
)

for check in ${checkdir[@]}; do
	if [ -f "$check/composer.json" ]; then
		cd $check
		composer update &
	fi
done
cd $dir
