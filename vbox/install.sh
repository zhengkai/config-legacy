#!/bin/bash -ex

cd $(dirname `readlink -f $0`)

sudo cp vbox /etc/init.d/vbox

sudo update-rc.d -f vbox remove

sudo update-rc.d vbox defaults

sudo update-rc.d vbox enable
