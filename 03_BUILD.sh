#!/bin/bash

# === EUREKA SERVER ===
cd eureka-server
mvn package
docker-compose build
cd ..

# === PATIENT SVC ===
cd patient-svc
mvn package
docker-compose build
cd ..

# === DISEASE SVC ===
cd disease-svc
mvn package
docker-compose build
cd ..

# === PERSONNEL SVC ===
cd personnel-svc
npm install
npm run build
docker-compose build
cd ..

# === DRUGS SVC ===
cd drugs-svc
docker-compose build
cd ..