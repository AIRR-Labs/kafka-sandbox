#!/bin/bash

echo "Connecting to $AIVEN_TOPIC (producer)"

./kafka/bin/kafka-console-producer.sh --broker-list kafka-trial-airrlabs-863b.aivencloud.com:10711 --topic $AIVEN_TOPIC --producer.config ~/configuration.properties