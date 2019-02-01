# base centos
FROM    python:3.6-stretch

ENV AIRFLOW_GPL_UNIDECODE yes
ENV SLUGIFY_USES_TEXT_UNIDECODE yes

RUN useradd -ms /bin/bash airflow &&
    chown -R airflow:airflow /home/airflow &&
    pip install "apache-airflow[all_dbs, async, devel, celery, crypto, druid, gcp_api, jdbc, hdfs, hive, mssql, mysql, postgres, password, qds, rabbitmq, slack, redis]"
    
# ADD source /home/kafka/

# RUN chown -R airflow:airflow /home/airflow

USER airflow
WORKDIR /home/airflow

# CMD ["/home/kafka/run-sandbox-kafka.sh"]
