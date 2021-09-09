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

.scripts/cleanup.sh

echo ""
echo "-------------------------------------------------"
echo "| deploying tutorial ..."
echo "-------------------------------------------------"
echo ""
kubectl apply -k $TUTORIAL_DIR
kubectl wait --for=condition=ready  --timeout=120s pod -l purpose=microgateway-tutorial

echo ""
echo "-------------------------------------------------"
echo "| verifying tutorial ..."
echo "-------------------------------------------------"
echo ""
.scripts/verify.sh $TUTORIAL_DIR