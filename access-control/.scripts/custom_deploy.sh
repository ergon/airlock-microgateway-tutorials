#!/bin/bash
set -euo pipefail

display_usage() {
        echo "Usage: $0 tutorial_dir"
        echo "tutorial_dir: Tutorial to run. Should point to an Exercise or Solution folder of an exercise."
        echo "Example: $0 Getting_used_to_DSL/Excercise"
        }

if [ -n "$1" ]; then
        TUTORIAL_DIR=$1
else
        echo "Please provide a tutorial directory..."
        display_usage
        exit 1
fi

source .secrets/dockerhub

kubectl create secret docker-registry dockerregcred \
  --docker-server='https://index.docker.io/v1/' \
  --docker-username=${DH_USER}\
  --docker-password=${DH_PWD} \
  --docker-email=${DH_EMAIL}

kubectl label secret dockerregcred purpose=microgateway-tutorial

mv .templates/iam/secret/iam.lic .templates/iam/secret/iam.lic.bak
cp .secrets/iam.lic .templates/iam/secret/iam.lic

kubectl replace --force -k $TUTORIAL_DIR
mv -f .templates/iam/secret/iam.lic.bak .templates/iam/secret/iam.lic