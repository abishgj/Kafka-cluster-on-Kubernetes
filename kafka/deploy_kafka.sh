#!/bin/bash

#Author: Abish G J
#This script will launch the broker dns and kafka services.
#Also launches the kafka servers

#Path where the YAML configs necessary for kafka deployment are stored
CONFIG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d $CONFIG_PATH ]; then
echo "YAML config files' path provided is invalid"
exit
fi

#Start the broker-dns and kafka services
kubectl create -f $CONFIG_PATH/broker_dns.yml
kubectl create -f $CONFIG_PATH/kafka_service.yml

#Start the kafka servers
kubectl create -f $CONFIG_PATH/kafka_app.yml
