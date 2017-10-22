#!/bin/bash

cd $(dirname `readlink -f $0`)

xkbcomp $DISPLAY xkb-a.dump
