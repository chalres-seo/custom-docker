#!/bin/bash

if [[ $# != 1 ]]
then
    echo "need 1 arg. docker container name."
    exit 1
fi

container_status="$(docker container inspect --format='{{.State.Status}}' $1 2>&1)"

if [[ $container_status == *"Error: No such container:"* ]]
then
    echo "docker container $1 is not exist"
    exit 0
else
    echo "docker container $1 is already exist. status: ${container_status}"
    exit 1
fi
