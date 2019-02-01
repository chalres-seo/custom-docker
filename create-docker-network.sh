#!/bin/bash

if [ `sudo docker network ls | grep -w sandbox-net | wc -l` = 0 ]
then
    sudo docker network create \
        --driver=bridge \
        --subnet=172.18.0.1/16 \
        sandbox-net
else
    echo "network is already exist."
fi
