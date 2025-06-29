#!/bin/bash
set -euo pipefail

mkdir -p deploy-result

kubectl create namespace "$NAMESPACE_NAME" 2>/dev/null || true
kubectl apply -k "$KUSTOMIZATION_DIRECTORY/$KB_PIPELINE_STAGE"
kubectl rollout status deployment/"$APP_NAME" --timeout=5m --namespace "$NAMESPACE_NAME" | tee -a deploy-result/deploy-output.txt
