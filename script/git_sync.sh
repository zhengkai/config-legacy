#!/bin/sh
cd ~/conf
git add .
git ci -a -m "auto save"
git pull
git push

