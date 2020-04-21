#!/bin/bash

chmod 777 *.sh
./00_INIT.sh
./01_CLEANUP.sh
./02_PREPARE.sh
./03_BUILD.sh
./04_START_ALL.sh