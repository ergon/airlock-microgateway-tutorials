#!/bin/bash

EXIT_CODE=0
minikube_ip=$(minikube ip)
if [ $? -ne 0 ]; then
    kubernetes_ip="localhost"
else
    kubernetes_ip=${minikube_ip}
fi

.scripts/common_verifications.sh
if [ "$?" -ne "0" ]; then
    EXIT_CODE=1
fi

STATUSCODE=$(curl -k -s -o /dev/null -w "%{http_code}" https://${kubernetes_ip}/)
if [ "${STATUSCODE}" = "200" ]
then
    echo "OK: Microgateway returned status code 200"
else
    echo "NOK: Microgateway did not return status code: ${STATUSCODE}"
    EXIT_CODE=1
fi

REQUEST_COUNT=$(kubectl logs -l app=microgateway -c microgateway --tail=-1 | grep -c "WR-SG-SUMMARY")
if [ "${REQUEST_COUNT}" -eq "1" ]
then
    echo "OK: Microgateway received 1 request: ${REQUEST_COUNT}"
else
    echo "NOK: Microgateway did not receive 1 request: ${REQUEST_COUNT}"
    EXIT_CODE=1
fi
REQUESTS_WO_SESSION=$(kubectl logs -l app=microgateway -c microgateway --tail=-1 | grep  WR-SG-SUMMARY | grep -c '"sess_id":"<n/a>"')
if [ "${REQUESTS_WO_SESSION}" -eq "0" ]
then
    echo "OK: Microgateway received no request w/o session: ${REQUESTS_WO_SESSION}"
else
    echo "NOK: Microgateway received requests w/o session: ${REQUESTS_WO_SESSION}"
    EXIT_CODE=1
fi

exit $EXIT_CODE