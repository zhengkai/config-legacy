#!/bin/bash

name='tilda'
window_num=6

cd $(dirname `readlink -f $0`)

./tmux.sh "$name" "$window_num"
