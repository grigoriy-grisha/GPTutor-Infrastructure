#!/bin/sh

git pull

# shellcheck disable=SC2164
cd ./GPTutor-Frontend

git pull

# shellcheck disable=SC2164
cd ../

docker-compose stop frontend
docker-compose rm --force frontend

docker-compose up -d frontend
