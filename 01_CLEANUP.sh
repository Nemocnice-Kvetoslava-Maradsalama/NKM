#!/bin/bash
docker stop $(docker ps -a -q) >/dev/null
docker rm $(docker ps -a -q) >/dev/null
docker network rm nemocnice-network >/dev/null
yes | docker network prune 