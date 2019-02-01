#!/bin/bash

./is_container_exist.sh test-redis

if [[ $? == 1 ]]
then
    exit 1
fi

CUSTOM_HOME="/home/charles/workspace/docker_app/redis"
CUSTOM_CONF_FILE="${CUSTOM_HOME}/test_redis.conf"

CUSTOM_VOL_ROOT="/home/charles/workspace/docker_app/docker_vol/test_redis"
CUSTOM_DATA_DIR="${CUSTOM_VOL_ROOT}/data"
CUSTOM_LOG_DIR="${CUSTOM_VOL_ROOT}/log"
CUSTOM_LOG_FILE="${CUSTOM_LOG_DIR}/redis_`date '+%Y%m%dT%H:%m:%S'`.log"

docker run \
    --name test-redis \
    --cpus="1" \
    --memory="512m" \
    --hostname "test-redis" \
    --net test-net \
    --ip 172.20.0.102 \
    -v ${CUSTOM_CONF_FILE}:/usr/local/etc/redis/redis.conf \
    -v ${CUSTOM_DATA_DIR}:/data \
    redis:latest redis-server /usr/local/etc/redis/redis.conf > ${CUSTOM_LOG_FILE} 2>&1 &

echo "docker test_redis start."
