#!/bin/bash

~/.vim/update.sh || : &

~/conf/update/npm.sh &
~/conf/update/ubuntu.sh &

~/conf/script/safe-git-pull.sh ~/conf
~/conf/script/safe-git-pull.sh ~/build
~/conf/script/safe-git-pull.sh ~/hide

wait

~/conf/script/reboot-check.sh
