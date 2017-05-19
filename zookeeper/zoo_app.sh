#!/bin/bash

#Author: Abish G J
#This script will launch the peer, leader-election and client services.
#Also launches the zookeeper servers

#Path where the YAML configs necessary for zookeeper deployment are stored
CONFIG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d $CONFIG_PATH ]; then
echo "YAML config files' path provided is invalid"
exit
fi

#Start the peer and leader-election services
kubectl create -f $CONFIG_PATH/peer_leader.yml
kubectl create -f $CONFIG_PATH/zoo_client.yml

echo "Provide hostpath(absolute path) to where the zookeeper data and config needs to be stored. Example: /tmp/zookeeper/"

read hostpath

if [ ! -d "$hostpath" ]; then
mkdir -p "$hostpath"
fi

mkdir "$hostpath/data" | chmod 765 "$hostpath/data"

cat $CONFIG_PATH/zookeeper_template.yml | sed "s|/tmp/zookeeper|$hostpath|" | kubectl create -f -
