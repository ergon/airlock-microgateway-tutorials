# lab specific additional verifications
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

# redis
pod_status="$(kubectl get pod -l app=redis --no-headers -o custom-columns=":status.phase")"
if [[ $pod_status == Running ]]; then
    echo "OK: redis pod is running"
else
    echo "NOK: redis pod is not running: $pod_status"
    EXIT_CODE=1
fi

# iam
pod_status="$(kubectl get pod -l app=iam --no-headers -o custom-columns=":status.phase")"
if [[ $pod_status == Running ]]; then
    echo "OK: iam pod is running"
else
    echo "NOK: iam pod is not running: $pod_status"
    EXIT_CODE=1
fi



# virtinc
pod_status="$(kubectl get pod -l app=virtinc --no-headers -o custom-columns=":status.phase")"
if [[ $pod_status == Running ]]; then
    echo "OK: virtinc pod is running"
else
    echo "NOK: virtinc pod is not running: $pod_status"
    EXIT_CODE=1
fi

# wordpress
pod_status="$(kubectl get pod -l app=wordpress --no-headers -o custom-columns=":status.phase")"
if [[ $pod_status == $'Running\nRunning' ]]; then
    echo "OK: wordpress/mariadb pods are running"
else
    echo "NOK: wordpress/mariadb pods are not running: $pod_status"
    EXIT_CODE=1
fi

mkdir build

STATUSCODE=$(curl -b build/cookies.txt -c build/cookies.txt -k -s -o /dev/null -w "%{http_code}" "https://${kubernetes_ip}/")
if [ "${STATUSCODE}" = "200" ]
then
    echo "OK: call to virtinc succeeded"
else
    echo "NOK: call to virtinc did not succeed: ${STATUSCODE}"
    EXIT_CODE=1
fi

STATUSCODE=$(curl -L -b build/cookies.txt -c build/cookies.txt -k -s -o /dev/null -w "%{http_code} %{num_redirects}" "https://${kubernetes_ip}/wordpress/")
if [ "${STATUSCODE}" = "200 1" ]
then
    echo "OK: call to blog was redirected to login page"
else
    echo "NOK: call to blog was not redirected to login page: ${STATUSCODE}"
    EXIT_CODE=1
fi

STATUSCODE=$(curl -b build/cookies.txt -c build/cookies.txt -X POST -H "Content-Type: application/json" -H "X-Same-Domain: 1" -d '{"location":"https://localhost/wordpress/"}' -k -s -o /dev/null -w "%{http_code}" "https://${kubernetes_ip}/auth/rest/public/authentication/location/access")
if [ "${STATUSCODE}" = "401" ]
then
    echo "OK: call to login page succeeded"
else
    echo "NOK: call to login page did not succeed: ${STATUSCODE}"
    EXIT_CODE=1
fi

STATUSCODE=$(curl -b build/cookies.txt -c build/cookies.txt -X POST -H "Content-Type: application/json" -H "X-Same-Domain: 1" -d '{"username":"user1","password":"password"}' -k -s -o /dev/null -w "%{http_code}" "https://${kubernetes_ip}/auth/rest/public/authentication/password/check")
if [ "${STATUSCODE}" = "200" ]
then
    echo "OK: login call succeeded"
else
    echo "NOK: login call did not succeed: ${STATUSCODE}"
    EXIT_CODE=1
fi

STATUSCODE=$(curl -b build/cookies.txt -c build/cookies.txt -k -s -o /dev/null -w "%{http_code}" "https://${kubernetes_ip}/wordpress/")
if [ "${STATUSCODE}" = "200" ]
then
    echo "OK: call to blog succeeded"
else
    echo "NOK: call to blog did not succeed: ${STATUSCODE}"
    EXIT_CODE=1
fi

rm -rf build

exit $EXIT_CODE
