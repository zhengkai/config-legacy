#!/bin/bash
dir=$(dirname `readlink -f $0`);
list=(`cat "$dir/aptget"`);

sudo apt-get install -f ${list[@]}


