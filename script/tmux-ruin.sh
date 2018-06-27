#!/bin/bash

name='ruin'
window_num=5
tmux='/usr/bin/tmux'

has_session=true
$tmux has-session -t $name 2>/dev/null || has_sesion=false

if [ "$has_sesion" = false ]; then

	$tmux -2 new-session -d -s $name

	i=$window_num
	while [ $i -gt 1 ]; do
		let i=$i-1
		$tmux new-window -t "$name:$i"
	done

	$tmux select-window -t "$name:0"

	$tmux send -t "$name:0" "cd /www/ruinone/client && make" ENTER
	$tmux send -t "$name:1" "cd /www/ruinone/server && make" ENTER
	$tmux send -t "$name:2" "cd /www/ruinone/bot && make" ENTER
fi

$tmux -2 attach -t $name
