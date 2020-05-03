# NKM integration repository
This repository hosts deploy scripts for the NKM project.

DO NOT USE ANY OF THESE SCRIPTS UNLESS YOU ARE ABSOLUTELY SURE OF WHAT THEY DO.

All the scripts here are expected to be run as the root user. If you run them as normal user, chances are something will not work.

## System prerequisites
 - git
 - docker
 - docker-compose
 - jdk (java 8)
 - apache maven
 - node.js + npm

## Cold start
The `_COLD_START.sh` script (re)starts the latest version of the entire system. However in the process of doing so, it STOPS AND DELETES ALL DOCKER CONTAINERS present on the host system, SO MAKE SURE YOU DO NOT USE IT IF YOU USE DOCKER FOR ANYTHING ELSE. It actually only runs the scripts numbered 00-04 which do the actual job, so if this behaviour does not suit you, you may prefer running only some of those scripts manually to achieve similar result.

## Hot start
`HOT_START.sh` does the same thing as cold start, except for updating local repositories, which is very useful for (re)starting the entire system in its current state (including any locally modified configuration files).

## Numbered scripts
 - `00_INIT.sh` - deletes any local changes and pulls the latest version of each service from github
 - `01_CLEANUP.sh` - stops and deletes all docker containers on the host machine, deletes all docker networks
 - `02_PREPARE.sh` - updates configuration for all NKM services and creates common docker network for them
 - `03_BUILD.sh` - builds all services and their docker images
 - `04_START_ALL.sh` - starts all NKM docker containers (`docker-compose up -d`)
 - `05_STOP_ALL.sh` - stops all NKM docker containers

## Helper scripts
 - `./AA_ATTACH.sh service-name` - attaches you to specified service container (so you see its output)
 - `./BB_SHELL.sh service-name` - gives you shell (ash) in the specified service container
 - `./YY_START.sh service-name` - starts specified service container (`docker-compose up -d`)
 - `./XX_STOP.sh service-name` - stops specified service container

## `service-name`
Instead of `service-name` use one of the following: `eureka-server`, `disease-svc`, `drugs-svc`, `patient-svc`, `personnel-svc`.

## Notes
 - Creation of network interfaces in a container is not deterministic. Thanks to that sometimes services register with wrong IP in eureka, which causes them do appear unavailable to other services. This happens most often with `drugs-svc` and `disease-svc`. I do not know about any reliable fix for this, usually restarting and changing order of networks in docker-compose helps.

 - Sometimes, some services simply fail to start properly. This is random and I do not even know why this happens. No reliable fix is available.