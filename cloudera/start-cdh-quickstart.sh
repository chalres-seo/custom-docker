#!/bin/bash

docker run --name "sandbox-cloudera" --hostname=quickstart.cloudera --privileged -i -t \
cloudera/quickstart /usr/bin/docker-quickstart
