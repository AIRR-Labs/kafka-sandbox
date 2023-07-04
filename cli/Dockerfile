FROM python:3.11-bullseye

RUN apt-get update && apt-get upgrade
RUN apt-get install -y curl scala dos2unix

WORKDIR /root

# install kafka toolbox
RUN curl https://downloads.apache.org/kafka/3.5.0/kafka_2.13-3.5.0.tgz -o kafka.tgz
RUN tar -xzf kafka.tgz
RUN mv kafka_2.13-3.5.0 kafka
RUN rm kafka.tgz

# install aiven client
RUN python -m pip install --upgrade pip
RUN python -m pip install aiven-client

# install fish (optional)
RUN apt-get install -y fish

COPY ./entrypoint.sh /root/entrypoint.sh
COPY ./configuration.properties /root/configuration.properties
COPY ./consumer.sh /root/consumer.sh
COPY ./producer.sh /root/producer.sh
RUN dos2unix *

CMD [ "/bin/bash", "-c", "./entrypoint.sh && fish" ]
