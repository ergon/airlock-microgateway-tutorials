#!/bin/bash

display_usage() {
        echo "Usage: $0 tutorial_dir\n"
        echo "tutorial_dir: Tutorial to verify. Should point to an Exercise or Solution folder of an exercise."
        echo "Example: $0 getting-started/solution"
        }

if [ -n "$1" ]; then
        TUTORIAL_DIR=$1
else
        echo "Please provide a tutorial directory..."
        display_usage
        exit 1
fi

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

if [[ -f "${TUTORIAL_DIR}/../.scripts/verify.sh" ]]; then
    ${TUTORIAL_DIR}/../.scripts/verify.sh
fi