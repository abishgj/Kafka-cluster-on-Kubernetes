#!/bin/bash

#Author: Abish G J
#This script will delete the broker dns and kafka services.
#Also deletes the kafka servers

#Path where the YAML configs necessary for kafka purge are stored
CONFIG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d $CONFIG_PATH ]; then
echo "YAML config files' path provided is invalid"
exit
fi

#Delete the broker-dns and kafka services
kubectl delete -f $CONFIG_PATH/broker_dns.yml
kubectl delete -f $CONFIG_PATH/kafka_service.yml

#Delete the kafka servers
kubectl delete -f $CONFIG_PATH/kafka_app.yml
