display_usage() {
        echo "Usage: $0 tutorial_dir\n"
        echo "tutorial_dir: Tutorial to verify. Should point to an Exercise or Solution folder of an exercise."
        echo "Example: $0 Getting_used_to_DSL/Excercise\n"
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

if [[ -f "${TUTORIAL_DIR}/../.scripts/verify.sh" ]]; then
    ${TUTORIAL_DIR}/../.scripts/verify.sh
fi