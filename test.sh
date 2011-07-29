#!/bin/bash
dir=$(dirname `readlink -f $0`);
filelist=(`cat "$dir/filelist"`);

echo $dir/filelist

for file in ${filelist[@]}
do
	ln -s -f $dir/$file ~/$file
done

