#!/bin/sh

apt install ubuntu-mate-desktop && \
apt-get install software-properties-common && \
add-apt-repository ppa:x2go/stable && \
apt-get update && \
apt-get install x2goserver x2goserver-xsession && \
apt-get install x2gomatebindings