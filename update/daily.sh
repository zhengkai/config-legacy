#!/bin/bash -e

DIR=`readlink -f "$0"` && DIR=`dirname "$DIR"` && cd "$DIR" || exit 1

sudo chown -R zhengkai:zhengkai /home/zhengkai &

./npm.sh &
./pip.sh &
./ubuntu.sh &

wait

./clean-motd.sh

./before-reboot.sh
./reboot-check.sh
