#!/bin/bash

# copy from http://chunzi.me/post/782

user=platinum
base_dir=~/github

if [ ! -d $base_dir ]; then
	mkdir $base_dir
fi

cd $base_dir

list=(`curl -s http://github.com/api/v2/yaml/repos/show/$user | grep ':url:' | awk -F/ '{print $NF}'`);

for repo in ${list[@]}
do
	url=git@github.com:$user

	echo
	echo -e \\t$repo
	echo
	echo $base_dir/$repo.git

	if [ ! -d $repo.git ]; then
		git clone --bare $url/$repo.git $repo.git
		cd $repo.git
		git remote rm origin
		git remote add --mirror origin $url/$repo.git
		cd ..
	else
		cd $repo.git
		git remote update
		cd ..
	fi
done

