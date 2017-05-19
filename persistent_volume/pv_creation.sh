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

mkdir "$hostpath/datadir-kafka-0" && chmod 765 "$hostpath/datadir-kafka-0"
mkdir "$hostpath/datadir-kafka-1" && chmod 765 "$hostpath/datadir-kafka-1"
mkdir "$hostpath/datadir-kafka-2" && chmod 765 "$hostpath/datadir-kafka-2"

cat $CONFIG_PATH/pv-template.yml | sed "s|/tmp/k8s-data|$hostpath|" | kubectl create -f -
cat $CONFIG_PATH/pv_claim.yml | kubectl create -f -
