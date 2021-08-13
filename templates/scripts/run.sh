../../templates/scripts/run_tutorial.sh

EXITCODE=$?
if [ $EXITCODE -ne 0 ]; then
  echo ""
  echo "**************************************************"
  echo "* Deployment NOK                                 *"
  echo "**************************************************"
  echo ""
  exit $EXITCODE
fi

echo ""
echo "**************************************************"
echo "* Deployment OK                                  *"
echo "**************************************************"
echo ""