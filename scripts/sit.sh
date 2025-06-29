#!/bin/bash

set -o errexit
set -o pipefail
set -o xtrace

echo "Importing application config"
source ./scripts/config.sh


echo "Starting Kubernetes Deployment"
chmod +x ./scripts/deploy.sh
./scripts/deploy.sh

export FDAS_SERVICE_URL="${NAMESPACE_NAME}.myorg.com"

echo "Running Integration tests ...."
#tests here..
