#!/bin/bash

#Author: Abish G J
#This script will purge the kafka cluster stateful set infrsatructure on kubernetes
#Note: This script will not delete the directories. To hard delete the data on directories run /storage/delete_directories.sh

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Delete namespace
#NOTE: All associated resources are deleted automatically
kubectl delete -f $ROOT_DIR/namespace.yml

#Delete persistent volumes
kubectl delete -f $ROOT_DIR/storage/pv_provision.yml
