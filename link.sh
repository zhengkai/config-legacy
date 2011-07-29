#!/bin/bash
dir=$(dirname `readlink -f $0`);
list=(`cat "$dir/filelist"`);

echo $dir/list

for file in ${list[@]}
do
	ln -s -f $dir/$file ~/$file
done

