#!/bin/bash
rm -rf -- */
git checkout -- .
git pull
git submodule update --init --recursive --remote
chmod 777 *.sh