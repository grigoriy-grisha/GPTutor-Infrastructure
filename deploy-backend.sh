#!/bin/sh

git pull

docker-compose stop backend
docker-compose rm --force backend

docker-compose up backend -d
