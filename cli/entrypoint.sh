#!/bin/bash

usage() {
    echo "Set the following environment variables:"
    echo "  AIVEN_AUTH_TOKEN: Aiven authentication token"
    echo "  AIVEN_EMAIL: Aiven user email"
    echo "  AIVEN_USERNAME: Aiven user name"
    echo "  PROJECT: Aiven project name"
    exit 1
}

if [ -z "$AIVEN_AUTH_TOKEN" -o -z "$AIVEN_EMAIL" -o -z "$AIVEN_USERNAME" -o -z "$PROJECT" ]; then
    usage
fi

# generate aiven-credentials from environment variables
echo "{\"auth_token\": \"$AIVEN_AUTH_TOKEN\", \"user_email\": \"$AIVEN_EMAIL\"}" > ./aiven-credentials.json

avn user login $AIVEN_EMAIL --token
avn service user-creds-download --username $AIVEN_USERNAME $PROJECT
avn service user-kafka-java-creds --username $AIVEN_USERNAME $PROJECT
