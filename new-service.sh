#!/bin/bash

SERVICE_NAME=$1
NAMESPACE=$2
PORT=${3:-80}

if [ -z "$SERVICE_NAME" ] || [ -z "$NAMESPACE" ]; then
  echo "Usage: ./new-service.sh <service-name> <namespace> [port]"
  exit 1
fi

cp -r template "$SERVICE_NAME"
cd "$SERVICE_NAME" || exit

# Replace tokens in all files
find . -type f -exec sed -i "s/{{SERVICE_NAME}}/$SERVICE_NAME/g" {} +
find . -type f -exec sed -i "s/{{NAMESPACE}}/$NAMESPACE/g" {} +
find . -type f -exec sed -i "s/{{PORT}}/$PORT/g" {} +

echo "Service '$SERVICE_NAME' generated successfully!"
