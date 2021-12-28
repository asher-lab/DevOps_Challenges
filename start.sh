#!/bin/bash -eu
CONFIGURATION_PATH="$(dirname $0)/helmfiles"

shift

NAMESPACE='harbor'

helm repo add harbor https://helm.goharbor.io
helm repo update

set +u

helm upgrade --install harbor harbor/harbor \
  --namespace ${NAMESPACE} \
  --create-namespace \
  --values ${CONFIGURATION_PATH}/configurations.yaml \
  --install --wait --timeout 300s ${@}


