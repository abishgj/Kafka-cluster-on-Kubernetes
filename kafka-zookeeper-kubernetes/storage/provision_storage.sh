#!/bin/bash

#Author: Abish G J
#This script will create the directories in hostpath for persistent volumes and launch the persistent volumes in kubernetes.
#Also the created persistent volumes are claimed for the kafka application.

#Path where the YAML configs necessary for persistent volume creation and claiming are stored.
CONFIG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d "$CONFIG_PATH" ]; then
echo "YAML config files' path provided is invalid"
exit
fi

echo "Provide hostpath(absolute path) to where the persistent volumes need to be created. Ex: /tmp/persistent_vols/"

read hostpath

if [ ! -d "$hostpath" ]; then
mkdir -p "$hostpath"
fi

#Create necessary directories
mkdir "$hostpath/datadir-kafka-0" && chmod 765 "$hostpath/datadir-kafka-0"
mkdir "$hostpath/datadir-kafka-1" && chmod 765 "$hostpath/datadir-kafka-1"
mkdir "$hostpath/datadir-kafka-2" && chmod 765 "$hostpath/datadir-kafka-2"
mkdir "$hostpath/datadir-zookeeper-0" && chmod 765 "$hostpath/datadir-zookeeper-0"
mkdir "$hostpath/datadir-zookeeper-1" && chmod 765 "$hostpath/datadir-zookeeper-1"

#Maintain list of directories created (used later for deletion)
echo "$hostpath/datadir-kafka-0" >> $CONFIG_PATH/directories_list.txt
echo "$hostpath/datadir-kafka-1" >> $CONFIG_PATH/directories_list.txt
echo "$hostpath/datadir-kafka-2" >> $CONFIG_PATH/directories_list.txt
echo "$hostpath/datadir-zookeeper-0" >> $CONFIG_PATH/directories_list.txt
echo "$hostpath/datadir-zookeeper-1" >> $CONFIG_PATH/directories_list.txt

cat $CONFIG_PATH/pv_template.yml | sed "s|/tmp/persistent_vols/data-kafka|$hostpath/data-kafka|" | sed "s|/tmp/persistent_vols/data-zookeeper|$hostpath/data-zookeeper|" > $CONFIG_PATH/pv_provision.yml

kubectl create -f $CONFIG_PATH/pv_provision.yml
kubectl create -f $CONFIG_PATH/pv_claim.yml
