#!/bin/bash
set -euo pipefail

APP_NAME="rest-api-template"
SERVICE_NAME=${APP_NAME}
READINESS_PROBE_PATH=/health/readiness
LIVENESS_PROBE_PATH=/health/liveness
STARTUP_PROBE_PATH=/health/readiness

export APP_NAME
export SERVICE_NAME
export READINESS_PROBE_PATH
export LIVENESS_PROBE_PATH
export STARTUP_PROBE_PATH
