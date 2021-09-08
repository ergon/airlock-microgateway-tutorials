#!/bin/bash

display_usage() {
        echo "Usage: $0 tutorial_dir"
        echo "tutorial_dir: Tutorial to run. Should point to an Exercise or Solution folder of an exercise."
        echo "Example: $0 Getting_used_to_DSL/Excercise"
        }

if [ -n "$1" ]; then
        TUTORIAL_DIR=$1
else
        echo "Please provide a tutorial directory..."
        display_usage
        exit 1
fi

.scripts/run_tutorial.sh $TUTORIAL_DIR

EXITCODE=$?
if [ $EXITCODE -ne 0 ]; then

  .scripts/display_info.sh 
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