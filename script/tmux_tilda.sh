#!/bin/bash

name='tilda'
window_num=6
tmux='/usr/bin/tmux'

if [ not $($tmux has-session -t $name 2>/dev/null) ] ; then

	$tmux -2 new-session -d -s $name

	i=$window_num
	while [ $i -gt 1 ]; do
		let i=$i-1
		$tmux new-window -t "$name:$i"
	done

	$tmux select-window -t "$name:0"
fi

$tmux -2 attach -t $name

