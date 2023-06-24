#!/bin/sh

git pull

sh .env.sh

# shellcheck disable=SC2164
cd ./GPTutor-Frontend

git pull

# shellcheck disable=SC2164
cd ../

sh .env.sh

docker-compose stop  frontend
docker-compose rm --force frontend

docker-compose build frontend
docker-compose up -d frontend

docker-compose -f docker-compose-dev-nginx.yaml down

docker volume rm gptutor_www-html

docker-compose stop nginx
docker-compose rm --force nginx

docker-compose build nginx
docker-compose up -d nginx

