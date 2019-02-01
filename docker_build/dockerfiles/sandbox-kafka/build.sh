#!/bin/bash

SCALA_VERSION=2.11
KAFKA_VERSION=2.1.0

KAFKA_BIN=kafka_${SCALA_VERSION}-${KAFKA_VERSION}
KAFKA_BIN_LINK_ADDRESS=http://apache.mirror.cdnetworks.com/kafka/${KAFKA_VERSION}/${KAFKA_BIN}.tgz

if [ -f "${KAFKA_BIN}.tgz" ]
then
    echo "exist kafka bin."
else
    echo "kafka bin not found, download bin"
    wget ${KAFKA_BIN_LINK_ADDRESS}
fi

rm -rf source/kafka_bin
tar xf ${KAFKA_BIN}.tgz --directory source/
mv source/${KAFKA_BIN} source/kafka_bin

sudo docker build -t sandbox-kafka:${SCALA_VERSION}-${KAFKA_VERSION} .
sudo docker tag sandbox-kafka:${SCALA_VERSION}-${KAFKA_VERSION} sandbox-kafka:latest

rm -rf source/kafka_bin
