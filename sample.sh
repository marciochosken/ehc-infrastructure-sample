#!/bin/bash
if [ "$1" != "postcustomization" ]; then exit 0; fi
apt update && apt upgrade -y
curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import && \
if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi
zerotier-cli join ${ztnetwork}