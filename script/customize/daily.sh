#!/bin/bash

~/conf/script/update-ubuntu.sh &

~/conf/script/safe-git-pull.sh ~/conf
~/conf/script/safe-git-pull.sh ~/build
~/conf/script/safe-git-pull.sh ~/hide

wait

~/conf/script/reboot-check.sh
