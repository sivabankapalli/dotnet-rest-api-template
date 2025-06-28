#!/bin/bash
set -euo pipefail

mkdir -p deploy-result

echo "Creating namespace (if needed)"
kubectl create namespace "$NAMESPACE_NAME" || echo "Namespace already exists"

echo "Applying kubernetes config"
kubectl apply -k "$KUSTOMIZATION_DIRECTORY/$KB_PIPELINE_STAGE"

echo "Waiting for deployment to rollout"
kubectl rollout status deployment/"$APP_NAME" --timeout=5m --namespace "$NAMESPACE_NAME" | tee -a deploy-result/deploy-output.txt

echo "Deployment complete"
