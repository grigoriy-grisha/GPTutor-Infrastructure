#!/bin/sh

git pull

# shellcheck disable=SC2164
cd ./GPTutor-Backend

git pull

# shellcheck disable=SC2164
cd ../


docker-compose stop  backend
docker-compose rm --force backend

docker-compose build backend
docker-compose up -d backend
