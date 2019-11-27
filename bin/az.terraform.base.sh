#!/bin/bash

set -euo pipefail

: "${ARM_CLIENT_ID}"
: "${ARM_CLIENT_SECRET}"
: "${ARM_SUBSCRIPTION_ID}"
: "${ARM_TENANT_ID}"
: "${PREFIX}"
: "${AZ_LOCATION}"

COMMAND=${1:-plan}

# clean_up() {
#   rm -f .terraform/terraform.tfstate
#   echo "cleanup..."
# }
# trap clean_up EXIT

STEP="platform"
STATE_FILE="${STEP}.tfstate"
MODULE="infra/azure/$STEP"
# TF_VARS="inventory/${STEP}.tfvars"

export TF_VAR_prefix="${PREFIX}"
export TF_VAR_location="${AZ_LOCATION}"
# export TF_VAR_target_account_id=${AWS_ACCOUNT_ID}
# export TF_VAR_states_bucket="${AWS_STATE_BUCKET}"
# export TF_VAR_dns_domain="${DNS_DOMAIN}"
# export TF_VAR_target_account_id="${AWS_ACCOUNT_ID}"
# export TF_VAR_environment="$ENVIRONMENT"

terraform init -reconfigure "${MODULE}"
# terraform init \
# -backend-config="bucket=${AWS_STATE_BUCKET}" \
# -backend-config="workspace_key_prefix=${STEP}" \
# -backend-config="key=$ENVIRONMENT/${STEP}/${STATE_FILE}" \
# -backend-config="encrypt=true" \
# -backend-config="region=${AWS_REGION}" \
# -backend-config="profile=${AWS_PROFILE}" \
# -backend=true -get=true \
# -reconfigure \
# "${MODULE}"

terraform "${COMMAND}" \
-refresh=true \
-state-out="${STATE_FILE}" \
"${MODULE}"
# -var-file="$TF_VARS" \
# -refresh=true "${MODULE}"
