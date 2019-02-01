#!/bin/bash

./create-docker-network.sh

sudo docker run -d \
    --name "sandbox-kafka" \
    --hostname "sandbox-kafka" \
    --net sandbox-net \
    --ip 172.18.0.10 \
    sandbox-kafka:latest
