#!/bin/bash

ENV=$1

if [ -z "$ENV" ]; then
  echo "Please provide environment"
  exit 1
fi

echo "Deploying to $ENV..."

helm upgrade --install my-app ./chart \
  -f configs/deploy.helm.charts.yml \
  --set environment=$ENV
  --set backend.configMaps.LOG_LEVEL="${LOG_LEVEL}"

echo "Done!"