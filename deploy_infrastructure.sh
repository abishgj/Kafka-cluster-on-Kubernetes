#!/bin/bash

#Author: Abish G J
#This is the main script which deploys the kafka cluster stateful set infrastructure on kubernetes

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Create a namespace for the deployment of kafka stateful set
kubectl create -f $ROOT_DIR/namespace.yml

#Create persistent volumes and bind the claims
bash $ROOT_DIR/storage/provision_storage.sh

#Deploy zookeeper servers and respective services
bash $ROOT_DIR/zookeeper/deploy_zookeeper.sh

#Deploy the Kafka cluster and respective services
bash $ROOT_DIR/kafka/deploy_kafka.sh
