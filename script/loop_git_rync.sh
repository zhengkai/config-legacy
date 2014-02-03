#!/bin/bash

list_file=$HOME"/git/fetch";
if [ ! -e $list_file ]; then
	echo
	echo 'file "'$list_file'" not exists'
	exit 1
fi

list=(`cat $list_file`)

for dir in ${list[@]}; do

	echo
	echo $dir

	if [ ! -d $dir"/.git" ]; then
		echo -e '\tnot a git repository'
		continue
	fi

	cd $dir
	git fetch
	echo -e '\tover'
done
