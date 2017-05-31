#!/bin/bash

#Author: Abish G J
# This script will delete the persistent volume storage and delete all the PV claims
# NOTE: This script does not delete the folders associated with the persistent volumes.

#Path where the YAML configs necessary for persistent volume and claim deletion are stored.
CONFIG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d "$CONFIG_PATH" ]; then
echo "YAML config files' path provided is invalid"
exit
fi

kubectl delete -f $CONFIG_PATH/pv_provision.yml
kubectl delete -f $CONFIG_PATH/pv_claim.yml
