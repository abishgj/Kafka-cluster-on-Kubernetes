#!/bin/bash

#Author: Abish G J
#This is the main script which deploys the kafka cluster stateful set on kubernetes

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Check if the required images are present in local else pull from remote
echo "Checking for required docker images"
if [ ! -z $(docker images -q rztdl/zookeeper-statefulset:1.0) ]; then
  echo "Pulling zookeeper docker image from rempte"
  echo ""
  sudo docker pull rztdl/zookeeper-statefulset:1.0
fi

if [ ! -z $(docker images -q rztdl/kafka-persistent:1.0) ]; then
  echo "Pulling kafka docker image from remote"
  echo ""
  sudo docker pull rztdl/zookeeper-statefulset:1.0
fi

#Create a namespace for the deployment of kafka stateful set
kubectl create -f $ROOT_DIR/namespace.yml

#Create persistent volumes and bind the claims
bash $ROOT_DIR/persistent_volume/pv_creation.sh

#Deploy zookeeper servers and respective services
bash $ROOT_DIR/zookeeper/zoo_app.sh

#Deploy the Kafka cluster and respective services
kubectl create -f broker_service.yml
kubectl create -f kafka_app.yml
