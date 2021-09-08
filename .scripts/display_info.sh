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
echo "| displaying microgateway configuration ..."
echo "-------------------------------------------------"
echo ""
kubectl describe configmap microgateway-config

echo ""
echo "-------------------------------------------------"
echo "| displaying microgateway secrets ..."
echo "-------------------------------------------------"
echo ""
kubectl describe secret microgateway-secret

echo ""
echo "-------------------------------------------------"
echo "| displaying microgateway service ..."
echo "-------------------------------------------------"
echo ""
kubectl describe service microgateway

echo ""
echo "-------------------------------------------------"
echo "| displaying ingress ..."
echo "-------------------------------------------------"
echo ""
kubectl describe ingress ingress-microgateway-default

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
