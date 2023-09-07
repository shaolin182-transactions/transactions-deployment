#!/bin/bash

EXPECTED_ARGS=1

function help
{
	echo "Usage : `basename $0` [env]"
	echo "@param env : PROD|DEV|PREPROD"
	echo "Exemple : ./start.sh PROD"
	exit 0
}

if [ $# -ne $EXPECTED_ARGS ] ;
then
	help
elif [ echo "$1" | grep -E -v "PROD|PREPROD|DEV" ]
  help
else
  export TARGET_ENV=$1
  docker-compose pull
  docker-compose up -d
fi

exit 0