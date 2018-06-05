#!/bin/bash

#alias gd='git diff --no-ext-diff -b -w -z --color=never | ~/conf/script/git_diff.php | less'

export LINES

let height=$LINES-3

count=`git diff --no-ext-diff -b -w -z --color=never $@ | ~/conf/script/git_diff.php | head -n $height | wc -l`

if [ $count -le 0 ]; then
	echo
	echo '    git diff: nothing has changed'
	echo
	exit
fi

if [ $count -ge $height ]; then
	git diff --no-ext-diff -b -w -z --color=never $@ | ~/conf/script/git_diff.php | less -r
else
	git diff --no-ext-diff -b -w -z --color=never $@ | ~/conf/script/git_diff.php
fi
