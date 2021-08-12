mgw_status="$(kubectl get pod -l app=microgateway --no-headers -o custom-columns=":status.phase")"

if [[ $mgw_status == Running ]]; then
    echo "OK: Microgateway is running"
    exit 0
else
    echo "NOK: Microgateway is not running: $mgw_status"
    exit 1
fi