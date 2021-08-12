#!/bin/bash
set -euo pipefail

echo ""
echo "-------------------------------------------------"
echo "| displaying deployment state ..."
echo "-------------------------------------------------"
echo ""
kubectl get all

echo ""
echo "-------------------------------------------------"
echo "| describing microgateway pod ..."
echo "-------------------------------------------------"
echo ""
kubectl describe pod -l app=microgateway

echo ""
echo "-------------------------------------------------"
echo "| displaying microgateway configbuilder log ..."
echo "-------------------------------------------------"
echo ""
kubectl logs -l app=microgateway -c configbuilder

echo "displaying microgateway runtime log ..."
echo ""
echo "-------------------------------------------------"
echo "| displaying microgateway runtime log ..."
echo "-------------------------------------------------"
echo ""
kubectl logs -l app=microgateway -c microgateway
