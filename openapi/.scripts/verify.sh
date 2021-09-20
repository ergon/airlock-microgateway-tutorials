# lab specific additional verifications
EXIT_CODE=0
minikube_ip=$(minikube ip)
if [ $? -ne 0 ]; then
    kubernetes_ip="localhost"
else
    kubernetes_ip=${minikube_ip}
fi

STATUSCODE=$(curl -k -s -o /dev/null -w "%{http_code}" https://${kubernetes_ip}/)
if [ "${STATUSCODE}" = "200" ]
then
    echo "OK: Microgateway returned status code 200 for swagger ui"
else
    echo "NOK: Microgateway did not return status code 200 for swagger ui: ${STATUSCODE}"
    EXIT_CODE=1
fi

REQUEST_COUNT=$(kubectl logs -l app=microgateway -c microgateway --tail=-1 | grep -c "WR-SG-SUMMARY")
if [ "${REQUEST_COUNT}" -ge "1" ]
then
    echo "OK: Microgateway served at least 1 request: ${REQUEST_COUNT}"
else
    echo "NOK: Microgateway did not serve request: ${REQUEST_COUNT}"
    EXIT_CODE=1
fi

curl -k -X PUT 'https://10.211.55.36/v3/pet' -H  'accept: */*' -H  'Content-Type: application/json' -d '{"photoUrls":["photoUrls","photoUrls"],"name":"doggie","id":0,"category":{"name":"name","id":6},"tags":[{"name":"name","id":1},{"name":"name","id":1}],"status":"available"}'
REQUEST_COUNT=$(kubectl logs -l app=microgateway -c microgateway --tail=-1 | grep -c "WR-SG-SUMMARY")
if [ "${REQUEST_COUNT}" -ge "2" ]
then
    echo "OK: Microgateway served at least 2 request: ${REQUEST_COUNT}"
else
    echo "NOK: Microgateway did not serve 2 requests: ${REQUEST_COUNT}"
    EXIT_CODE=1
fi

curl -k -X PUT 'https://10.211.55.36/v3/pet' -H  'accept: */*' -H  'Content-Type: application/json' -d '{"photoUrl":["photoUrls","photoUrls"],"name":"doggie","id":0,"category":{"name":"name","id":6},"tags":[{"name":"name","id":1},{"name":"name","id":1}],"status":"available"}'
REQUEST_COUNT=$(kubectl logs -l app=microgateway -c microgateway --tail=-1 | grep -c "WR-SG-SUMMARY")
if [ "${REQUEST_COUNT}" -ge "3" ]
then
    echo "OK: Microgateway served at least 3 request: ${REQUEST_COUNT}"
else
    echo "NOK: Microgateway did not serve 3 requests: ${REQUEST_COUNT}"
    EXIT_CODE=1
fi

REQUEST_COUNT=$(kubectl logs -l app=microgateway -c microgateway --tail=-1 | grep -c "WR-SG-BLOCK-115")
if [ "${REQUEST_COUNT}" -ge "1" ]
then
    echo "OK: Microgateway blocked at least 1 request: ${REQUEST_COUNT}"
else
    echo "NOK: Microgateway did not block request: ${REQUEST_COUNT}"
    EXIT_CODE=1
fi


exit $EXIT_CODE