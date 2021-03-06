#!/bin/bash

CUSTOM_HOME="/home/charles/workspace/docker_app/postgres"
CUSTOM_CONF_FILE="${CUSTOM_HOME}/prod_postgresql.conf"

CUSTOM_VOL_ROOT="/home/charles/workspace/docker_app/docker_vol/prod_postgres"
CUSTOM_DATA_DIR="${CUSTOM_VOL_ROOT}/data"
CUSTOM_LOG_DIR="${CUSTOM_VOL_ROOT}/log"

docker run -d \
    --name prod-postgres \
    --cpus="1" \
    --memory="512m" \
    --hostname "prod-postgres" \
    --net prod-net \
    --ip 172.21.0.101 \
    -v ${CUSTOM_CONF_FILE}:/etc/postgresql/postgresql.conf \
    -v ${CUSTOM_DATA_DIR}:/var/lib/postgresql/data \
    -v ${CUSTOM_LOG_DIR}:/var/lib/postgresql/log \
    -e POSTGRES_PASSWORD=postgres \
    postgres:latest -c config_file=/etc/postgresql/postgresql.conf
