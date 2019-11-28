#!/bin/bash

set -euo pipefail

: "${ARM_CLIENT_ID}"
: "${ARM_CLIENT_SECRET}"
: "${ARM_SUBSCRIPTION_ID}"
: "${ARM_TENANT_ID}"
: "${PREFIX}"
: "${AZ_LOCATION}"

COMMAND=${1:-plan}

clean_up() {

  echo "cleanup..."
}
trap clean_up EXIT

STEP="platform"
STATE_FILE="states/${STEP}.tfstate"
MODULE="infra/azure/$STEP"
# TF_VARS="inventory/${STEP}.tfvars"

export TF_VAR_prefix="${PREFIX}"
export TF_VAR_location="${AZ_LOCATION}"
export TF_VAR_region="${AZ_LOCATION}"

terraform init -reconfigure "${MODULE}"

# TODO: state is hacked. we should have an if/else for state in case of first deployment
terraform "${COMMAND}" \
-refresh=true \
-state="${STATE_FILE}" \
-state-out="${STATE_FILE}" \
"${MODULE}"

# -var-file="$TF_VARS" \

