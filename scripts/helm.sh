#!/bin/bash

ENV=$1

if [ -z "$ENV" ]; then
  echo "Please provide environment"
  exit 1
fi

echo "Deploying to $ENV..."

helm upgrade --install my-app ./chart \
  -f configs/deploy.hel.charts.yml \
  --set environment=$ENV

echo "Done!"