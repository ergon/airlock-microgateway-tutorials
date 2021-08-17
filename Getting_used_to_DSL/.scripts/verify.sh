# lab specific additional verifications
minikube_ip=$(minikube ip)
STATUSCODE=$(curl -k -s -o /dev/null -w "%{http_code}" https://$minikube_ip/)
if [ "${STATUSCODE}" = "503" ]
then
    echo "OK: Microgateway returned status code 503"
else
    echo "NOK: Microgateway did not return status code 503"
fi

REQUEST_COUNT=$(kubectl logs -l app=microgateway -c microgateway --tail=-1 | grep -c "WR-SG-SUMMARY")
if [ "${REQUEST_COUNT}" -ge "1" ]
then
    echo "OK: Microgateway served at least 1 request: ${REQUEST_COUNT}"
else
    echo "NOK: Microgateway did not serve request: ${REQUEST_COUNT}"
fi