#!/bin/sh
set -Eeuo pipefail

git pull 

docker-compose pull

# docker-compose down --remove-orphans 

docker-compose up -d --build --remove-orphan
