#!/bin/bash
set -euo pipefail

echo ""
echo "-------------------------------------------------"
echo "| cleaning up ..."
echo "-------------------------------------------------"
echo ""
kubectl delete all,ingress,configmap,secrets --all
