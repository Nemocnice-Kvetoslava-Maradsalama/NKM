#!/bin/bash
PARAM="$1"
RES=$(docker container ls | grep $PARAM)
if ! [ "$RES" == "" ]; then
ID=$(echo $RES | awk ' {print $1}')
docker exec -it $ID ash
fi