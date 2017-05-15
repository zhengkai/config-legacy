#!/bin/bash -ex
dir=$(dirname `readlink -f $0`);
list=(`cat "$dir/filelist"`);

echo $dir/list

for file in ${list[@]}; do
	if [ -e ~/$file ]; then
		continue;
	fi
	ln -s -f $dir/$file ~/$file
done

cpfile=(
	'.my.cnf'
)

for file in ${cpfile[@]}; do
	if [ -e ~/$file ]; then
		continue;
	fi
	cp $dir/$file ~/$file
done
