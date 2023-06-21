#!/bin/bash

echo "Connecting to $AIVEN_TOPIC (consumer)"

./kafka/bin/kafka-console-consumer.sh --bootstrap-server kafka-trial-airrlabs-863b.aivencloud.com:10711 --topic $AIVEN_TOPIC --consumer.config ~/configuration.properties --from-beginning