#!/bin/bash
set -euo pipefail

echo ""
echo "-------------------------------------------------"
echo "| cleaning up ..."
echo "-------------------------------------------------"
echo ""
kubectl delete all,ingress,configmap,secrets --all

echo ""
echo "-------------------------------------------------"
echo "| deploying tutorial ..."
echo "-------------------------------------------------"
echo ""
kubectl apply -k .
kubectl wait --for=condition=ready  --timeout=120s pod --all

../../templates/display_info.sh

echo ""
echo "-------------------------------------------------"
echo "| verifying tutorial ..."
echo "-------------------------------------------------"
echo ""
../../templates/verify.sh
../verify.sh