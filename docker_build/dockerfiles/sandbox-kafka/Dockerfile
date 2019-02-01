# base centos
FROM    openjdk:8-jdk-slim-stretch

RUN useradd -ms /bin/bash kafka

ADD source /home/kafka/

RUN chown -R kafka:kafka /home/kafka

USER kafka
WORKDIR /home/kafka

CMD ["/home/kafka/run-sandbox-kafka.sh"]
