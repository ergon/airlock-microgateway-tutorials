# lab specific additional verifications
EXIT_CODE=0
minikube_ip=$(minikube ip)
if [ $? -ne 0 ]; then
    kubernetes_ip="localhost"
else
    kubernetes_ip=${minikube_ip}
fi


mgw_status="$(kubectl get pod -l app=microgateway -l backend=echo --no-headers -o custom-columns=":status.phase")"
if [[ $mgw_status == Running ]]; then
    echo "OK: Microgateway for echo service is running"
else
    echo "NOK: Microgateway for echo service is not running: $mgw_status"
    EXIT_CODE=1
fi

mgw_status="$(kubectl get pod -l app=microgateway -l backend=grafana --no-headers -o custom-columns=":status.phase")"
if [[ $mgw_status == Running ]]; then
    echo "OK: Microgateway for grafana service is running"
else
    echo "NOK: Microgateway for grafana service is not running: $mgw_status"
    EXIT_CODE=1
fi

mgw_status="$(kubectl get pod -l app=microgateway -l backend=prometheus --no-headers -o custom-columns=":status.phase")"
if [[ $mgw_status == Running ]]; then
    echo "OK: Microgateway for prometheus service is running"
else
    echo "NOK: Microgateway for prometheus service is not running: $mgw_status"
    EXIT_CODE=1
fi

pod_status="$(kubectl get pod -l app=echoserver --no-headers -o custom-columns=":status.phase")"
if [[ $pod_status == Running ]]; then
    echo "OK: echo server pod is running"
else
    echo "NOK: echo server pod is not running: $mgw_status"
    EXIT_CODE=1
fi

pod_status="$(kubectl get pod -l app=grafana --no-headers -o custom-columns=":status.phase")"
if [[ $pod_status == Running ]]; then
    echo "OK: grafana pod is running"
else
    echo "NOK: grafana pod is not running: $mgw_status"
    EXIT_CODE=1
fi

pod_status="$(kubectl get pod -l app=redis --no-headers -o custom-columns=":status.phase")"
if [[ $pod_status == Running ]]; then
    echo "OK: redis pod is running"
else
    echo "NOK: redis pod is not running: $mgw_status"
    EXIT_CODE=1
fi

STATUSCODE=$(curl -k -s -o /dev/null -w "%{http_code}" https://${kubernetes_ip}/echo/)
if [ "${STATUSCODE}" = "200" ]
then
    echo "OK: echo service returned status code 200"
else
    echo "NOK: echo service did not return status code 200: ${STATUSCODE}"
    EXIT_CODE=1
fi

STATUSCODE=$(curl -k -s -o /dev/null -w "%{http_code}" https://${kubernetes_ip}/grafana/d/airlock_microgateway/airlock-microgateway)
if [ "${STATUSCODE}" = "200" ]
then
    echo "OK: grafana returned status code 200"
else
    echo "NOK: grafana did not return status code 200: ${STATUSCODE}"
    EXIT_CODE=1
fi

STATUSCODE=$(curl -k -s -o /dev/null -w "%{http_code}" https://${kubernetes_ip}/prometheus/targets)
if [ "${STATUSCODE}" = "200" ]
then
    echo "OK: prometheus returned status code 200"
else
    echo "NOK: prometheus did not return status code 200: ${STATUSCODE}"
    EXIT_CODE=1
fi

WORKLOAD=$(curl -k "https://$kubernetes_ip/prometheus/api/v1/query?query=airlock_workload_ratio" | jq '.data.result[] | select(.metric.job=="kubernetes-pods") | select(.metric.kubernetes_pod_name|test("^echo-microgateway-.")) | .value[1]')
if [ -z "$WORKLOAD" ]
then
    echo "NOK: prometheus did not return workload for echo-microgateway: ${WORKLOAD}"
    EXIT_CODE=1
else
    echo "OK: prometheus returned workload for echo-microgateway: ${WORKLOAD}"
fi
exit $EXIT_CODE