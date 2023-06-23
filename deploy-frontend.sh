#!/bin/sh

git pull

docker-compose stop frontend
docker-compose rm --force frontend

docker-compose up frontend -d
