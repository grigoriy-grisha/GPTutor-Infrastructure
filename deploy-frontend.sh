#!/bin/sh

git pull

cp ./.env-frontend ./GPTutor-Frontend/.env

# shellcheck disable=SC2164
cd ./GPTutor-Frontend

git pull

# shellcheck disable=SC2164
cd ../

docker-compose stop  frontend
docker-compose rm --force frontend

docker-compose build frontend
docker-compose up -d frontend
