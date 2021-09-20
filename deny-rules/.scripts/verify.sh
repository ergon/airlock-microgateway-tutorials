# lab specific additional verifications
EXIT_CODE=0
minikube_ip=$(minikube ip)
if [ $? -ne 0 ]; then
    kubernetes_ip="localhost"
else
    kubernetes_ip=${minikube_ip}
fi

STATUSCODE=$(curl -k -s -o /dev/null -w "%{http_code}" "https://${kubernetes_ip}/?s=%27+or+1%3D1--")
if [ "${STATUSCODE}" = "200" ]
then
    echo "OK: Deny rule exception worked"
else
    echo "NOK: Deny rule exception did not work: ${STATUSCODE}"
    EXIT_CODE=1
fi

STATUSCODE=$(curl -k -s -o /dev/null -w "%{http_code}" "https://${kubernetes_ip}/test/?s=%27+or+1%3D1--")
if [ "${STATUSCODE}" = "400" ]
then
    echo "OK: attack on different path was blocked"
else
    echo "NOK: attack on different path was not blocked: ${STATUSCODE}"
    EXIT_CODE=1
fi

REQUEST_COUNT=$(kubectl logs -l app=microgateway -c microgateway --tail=-1 | grep -c "WR-SG-BLOCK-110-01")
if [ "${REQUEST_COUNT}" -eq "1" ]
then
    echo "OK: Microgateway blocked 1 request: ${REQUEST_COUNT}"
else
    echo "NOK: Microgateway did not block 1 request: ${REQUEST_COUNT}"
    EXIT_CODE=1
fi

exit $EXIT_CODE