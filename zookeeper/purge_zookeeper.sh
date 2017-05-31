#!/bin/bash

#Author: Abish G J
#This script will delete the peer, leader-election and client services.
#Also deletes the zookeeper servers

#Path where the YAML configs necessary for zookeeper deployment are stored
CONFIG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d $CONFIG_PATH ]; then
echo "YAML config files' path provided is invalid"
exit
fi

#Start the peer and leader-election services
kubectl delete -f $CONFIG_PATH/broker_dns.yml
kubectl delete -f $CONFIG_PATH/kafka_service.yml

kubectl delete -f $CONFIG_PATH/kafka_app.yml
