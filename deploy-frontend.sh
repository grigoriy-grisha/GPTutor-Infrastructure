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

docker-compose stop nginx
docker-compose rm --force nginx

docker-compose build nginx
docker-compose up -d nginx

