#!/bin/bash

EXPECTED_ARGS=1

function help
{
	echo "Usage : `basename $0` [env]"
	echo "@param env : PROD|DEV|PREPROD"
	echo "Exemple : ./start.sh PROD"
	exit 0
}

#if [ $# -ne $EXPECTED_ARGS ] ;
#then
#	help
#elif [ echo "$1" | grep -E -v "PROD|PREPROD|DEV" ]
#  help
#else
#  export TARGET_ENV=$1

  # Create namespace
  kubectl apply -f ./k8s/namespace/

  # Create PV
  kubectl apply -f ./k8s/pv/

  # Create config maps
  kubectl create configmap transactions-config-server-config-map --from-file=./config/transactions-config-server/ -n transactions
  kubectl create configmap transactions-ihm-angular-config-map --from-file=./config/transactions-ihm-angular/ -n transactions

  # Apply K8S resources
  kubectl apply --recursive -f ./k8s/
#fi

exit 0