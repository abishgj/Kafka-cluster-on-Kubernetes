# Kafka-cluster-on-Kubernetes
Deployment of a Kafka cluster on Kubernetes as a stateful set

This project aims to deploy a Kafka cluster on Kubernetes. Kubernetes provides stateful set services which is helpfull for failovers.

# Deployment steps:

Install Kubernetes (fully fledged) and also install kubectl command.

Note: The scripts in this project uses `kubectl` to deploy the pods.

Follow the steps mentioned below :

1. Clone this project on Kubernetes master using `git clone `
2. Run the deploy script as `bash deploy_kafka_sset.sh`
