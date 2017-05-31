# Kafka-cluster-on-Kubernetes
Deployment of a Kafka cluster on Kubernetes as a stateful set

This project aims to deploy a Kafka cluster on Kubernetes. Kubernetes provides stateful set services which is helpfull for failovers.

# Deployment steps:

Install Kubernetes (fully fledged) and also install kubectl command.

Note: The scripts in this project uses `kubectl` to deploy the pods.

Follow the steps mentioned below to deploy:

1. Clone this project on Kubernetes master using `git clone https://github.com/abishgj/Kafka-cluster-on-Kubernetes.git`.
2. Run the deploy script as `bash deploy_infrastructure.sh`.
3. You can verify your deployment using Kubernetes dashboard or using the test client in test/testclient.yml.

# Purge deployment steps:

1. Run the purge script as `bash purge_infrastructure.sh`.
2. Run the script `bash /storage/delete_directories.sh` to hard delete the data.
