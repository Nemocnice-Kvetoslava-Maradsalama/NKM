#!/bin/bash
shopt -s globstar nullglob
for dir in ./*svc*/;do
if [ -f "$dir/docker-compose.yml" ]; then
cat $dir/docker-compose.yml | sed -i 's/.*EUREKA_HOST.*/      EUREKA_HOST: eureka-server/' $dir/docker-compose.yml
fi
done

cat eureka-server/docker-compose.yml | sed -i 's/.*EUREKA_ENV.*/      EUREKA_ENV: prod/' eureka-server/docker-compose.yml
cat disease-svc/docker-compose.yml | sed -i 's/.*8080:8080.*/      - 8081:8080/' disease-svc/docker-compose.yml
cat personnel-svc/docker-compose.yml | sed -i 's/.*SERVER_HOSTNAME.*/      SERVER_HOSTNAME: personnel-svc/' personnel-svc/docker-compose.yml
cat drugs-svc/docker-compose.yml | sed -i 's/.*drugs-svc:.*/  drug-svc:/' drugs-svc/docker-compose.yml
cat drugs-svc/server.js | sed -i 's/.*const eth0Interfaces.*/const eth0Interfaces=interfaces["eth1"]/' drugs-svc/server.js

docker network create nemocnice-network
