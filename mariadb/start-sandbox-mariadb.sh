#!/bin/bash

./create-docker-network.sh

sudo docker run -d \
    --name sandbox-mariadb \
    --hostname sandbox-mariadb \
    --net sandbox-net \
    --ip 172.18.0.22 \
    -e MYSQL_ROOT_PASSWORD=mariadb \
    -e MYSQL_DATABASE=DB_SANDBOX \
    mariadb:latest --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
