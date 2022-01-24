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

STATUSCODE=$(curl -k -s -o /dev/null -w "%{http_code}" -H "Authorization: Bearer eyJjdHkiOiJKV1QiLCJlbmMiOiJBMjU2R0NNIiwiYWxnIjoiZGlyIn0..q_382QLa9P1N5xuv.STvykuZALmVkEDeRVssJ5J-W7gU-fbEUa3D-drurDji2CltNV31EW7mF7jnW-IGUw9dBvapHDtt-ADne8AhzpbDpmsCFDGY4pTbp-LFXpVtsLfhT1aWM8C245tB2CBT5Mr-wHzxfyRHwusZhgIljqE0qzQl6Ys-lxG2lYaXLc51ajBtq2C8TJoZ1WadhToNGoNx_begTDescWBerlrQxL-P2kMB-A_F_OpkUFkX3-S6dZOxtBTK-8EzZUvc_ButxskYjm24M3QneJ8J1NER0DORqxKh-MKdj3eTdYiQNUJ72N_POEQg_ubvDeSD4J9mF0XShE8Z5fWVhtPbzzw1VCSQbcp2gpIWfZuEnxkguwQwr1sV2.GcTNSVOFh5Coog2rY7dGXg" https://${kubernetes_ip}/echo/)
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

sleep 30
WORKLOAD=$(curl -k "https://$kubernetes_ip/prometheus/api/v1/query?query=airlock_workload_ratio" | jq '.data.result[] | select(.metric.job=="kubernetes-pods") | select(.metric.kubernetes_pod_name|test("^echo-microgateway-.")) | .value[1]')
if [ -z "$WORKLOAD" ]
then
    echo "NOK: prometheus did not return workload for echo-microgateway: ${WORKLOAD}"
    EXIT_CODE=1
else
    echo "OK: prometheus returned workload for echo-microgateway: ${WORKLOAD}"
fi
exit $EXIT_CODE