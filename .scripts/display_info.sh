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
echo "| describing pods ..."
echo "-------------------------------------------------"
echo ""
kubectl describe pod -l purpose=microgateway-tutorial

echo ""
echo "-------------------------------------------------"
echo "| displaying configmaps (configuration) ..."
echo "-------------------------------------------------"
echo ""
kubectl describe configmap -l purpose=microgateway-tutorial

echo ""
echo "-------------------------------------------------"
echo "| displaying microgateway secrets ..."
echo "-------------------------------------------------"
echo ""
kubectl describe secret -l purpose=microgateway-tutorial

echo ""
echo "-------------------------------------------------"
echo "| displaying microgateway service ..."
echo "-------------------------------------------------"
echo ""
kubectl describe service -l purpose=microgateway-tutorial

echo ""
echo "-------------------------------------------------"
echo "| displaying ingress ..."
echo "-------------------------------------------------"
echo ""
kubectl describe ingress -l purpose=microgateway-tutorial

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
