#!/bin/bash

registry="hortonworks"
name="sandbox-hdp"
version="3.0.1"

hostname="sandbox-hdp.hortonworks.com"
network="sandbox-net"

./create-docker-network.sh

# pull and tag the sandbox and the proxy container
sudo docker pull "$registry/$name:$version"

# Deploy the sandbox into the cda docker network
sudo docker run --privileged \
    --name $name \
    -h $hostname \
    --network=$network \
    --network-alias=$hostname \
    --ip 172.18.0.31 \
    -d "$registry/$name:$version"

# echo "Remove existing postgres run files. Please wait"
# sleep 2
# docker exec -t "$name" sh -c "rm -rf /var/run/postgresql/*; systemctl restart postgresql-9.6.service;"
