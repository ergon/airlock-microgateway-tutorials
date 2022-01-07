#!/bin/bash
set -euo pipefail

echo ""
echo "-------------------------------------------------"
echo "| cleaning up ..."
echo "-------------------------------------------------"
echo ""
kubectl delete all -l purpose=microgateway-tutorial --force

sleep 5

kubectl delete ing,cm,secrets,pv,pvc,sa,roles,rolebindings,clusterroles,clusterrolebindings -l purpose=microgateway-tutorial --wait=true