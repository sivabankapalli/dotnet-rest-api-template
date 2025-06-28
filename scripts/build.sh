#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
BUILD_OUTPUT_DIR="$SCRIPT_DIR/../build-result"
DOCKERFILE_PATH="$SCRIPT_DIR/../Dockerfile"
BUILD_CONTEXT="$SCRIPT_DIR/../.."

mkdir -p "$BUILD_OUTPUT_DIR"

docker build \
    --tag "${IMAGE_ARTIFACTS%%:*}" \
    --file "$DOCKERFILE_PATH" \
    "$BUILD_CONTEXT"
