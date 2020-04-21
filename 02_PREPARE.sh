#!/bin/bash
shopt -s globstar nullglob
for dir in ./*svc*/;do
if [ -f "$dir/docker-compose.yml" ]; then
cat $dir/docker-compose.yml | sed -i 's/.*EUREKA_HOST.*/      EUREKA_HOST: eureka-server/' $dir/docker-compose.yml
fi
done
cat eureka-server/docker-compose.yml | sed -i 's/.*EUREKA_ENV.*/      EUREKA_ENV: prod/' eureka-server/docker-compose.yml
docker network create nemocnice-network
