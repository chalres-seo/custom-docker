#!/bin/bash

kafka_home=/home/kafka/kafka_bin
kafka_conf=/home/kafka/sandbox-kafka-conf

date_time=`date +'%Y%m%d_%H%M%S'`

echo ">> make runnung env dir. logs, data"
mkdir ${kafka_home}/logs
mkdir ${kafka_home}/data
echo ">> done."
echo ""

echo "start zookeeper."
${kafka_home}/bin/zookeeper-server-start.sh ${kafka_conf}/zookeeper.properties \
 1> ${kafka_home}/logs/sandbox-kafka_zookeeper_${date_time}.log \
 2> ${kafka_home}/logs/sandbox-kafka_zookeeper_${date_time}.err &

echo "start kafka broker-1"
${kafka_home}/bin/kafka-server-start.sh ${kafka_conf}/server-1.properties \
 1> ${kafka_home}/logs/sandbox-kafka_server_1_${date_time}.log \
 2> ${kafka_home}/logs/sandbox-kafka_server_1_${date_time}.err &

echo "start kafka broker-2"
${kafka_home}/bin/kafka-server-start.sh ${kafka_conf}/server-2.properties \
 1> ${kafka_home}/logs/sandbox-kafka_server_2_${date_time}.log \
 2> ${kafka_home}/logs/sandbox-kafka_server_2_${date_time}.err &

echo "start kafka broker-3"
${kafka_home}/bin/kafka-server-start.sh ${kafka_conf}/server-3.properties \
 1> ${kafka_home}/logs/sandbox-kafka_server_3_${date_time}.log \
 2> ${kafka_home}/logs/sandbox-kafka_server_3_${date_time}.err
