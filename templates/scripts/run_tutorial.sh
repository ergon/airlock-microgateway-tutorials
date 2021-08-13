#!/bin/bash
set -euo pipefail

../../templates/scripts/cleanup.sh

echo ""
echo "-------------------------------------------------"
echo "| deploying tutorial ..."
echo "-------------------------------------------------"
echo ""
kubectl apply -k .
kubectl wait --for=condition=ready  --timeout=120s pod --all

../../templates/scripts/display_info.sh

echo ""
echo "-------------------------------------------------"
echo "| verifying tutorial ..."
echo "-------------------------------------------------"
echo ""
../../templates/scripts/verify.sh