#!/bin/bash

./create-docker-network.sh

sudo docker run -d \
    --name sandbox-mysql \
    --hostname sandbox-mysql \
    --net sandbox-net \
    --ip 172.18.0.23 \
    -e MYSQL_ROOT_PASSWORD=mysql \
    -e MYSQL_DATABASE=DB_SANDBOX \
    mysql:latest --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
