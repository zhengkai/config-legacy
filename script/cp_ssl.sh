#!/bin/bash -ex

ssh freya "sudo cp -R /etc/nginx/ssl.d /tmp/ && sudo chown -R zhengkai:zhengkai /tmp/ssl.d"
scp -r freya:/tmp/ssl.d /tmp/
sudo cp -R /tmp/ssl.d/* /etc/nginx/ssl.d/
sudo chown root:root /etc/nginx/ssl.d/*
ssh freya "sudo rm -rf /tmp/ssl.d"
sudo rm -rf /tmp/ssl.d
