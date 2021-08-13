mgw_status="$(kubectl get pod -l app=microgateway --no-headers -o custom-columns=":status.phase")"

if [[ $mgw_status == Running ]]; then
    echo "OK: Microgateway is running"
else
    echo "NOK: Microgateway is not running: $mgw_status"
    exit 1
fi

if [[ -f "../verify.sh" ]]; then
    ../verify.sh
fi