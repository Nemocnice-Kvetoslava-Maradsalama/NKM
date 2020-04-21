#!/bin/bash
PARAM="$1"
if [ -d "$PARAM" ]; then
    cd $PARAM
    docker-compose up -d
cd ..
else
echo "path does not exist"
fi