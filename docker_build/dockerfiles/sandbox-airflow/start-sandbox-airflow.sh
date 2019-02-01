#!/bin/bash

sudo docker run -it --rm \
    --name "sandbox-airfolw" \
    --hostname "sandbox-airflow" \
    --net sandbox-net \
    --ip 172.18.0.51 \
    -e SLUGIFY_USES_TEXT_UNIDECODE=yes \
    python:3.6-stretch /bin/bash
