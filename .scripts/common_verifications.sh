#!/bin/bash

mgw_status="$(kubectl get pod -l app=microgateway --no-headers -o custom-columns=":status.phase")"

if [[ $mgw_status == Running ]]; then
    echo "OK: Microgateway is running"
else
    echo "NOK: Microgateway is not running: $mgw_status"
    exit 1
fi

mgw_ready_count="$(kubectl get pod -l app=microgateway  | grep 1/1 | wc -l)"

if [[ $mgw_ready_count -eq 1 ]]; then
    echo "OK: Microgateway is ready"
else
    echo "NOK: Microgateway is not running - number of pods ready: $mgw_ready_count"
    exit 1
fi