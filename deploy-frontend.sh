#!/bin/sh

git pull

sh .env.sh

cd ./GPTutor-Frontend || exit
git pull

cd ../ || exit

sh .env.sh

docker-compose stop  frontend
docker-compose rm --force frontend

docker-compose build frontend
docker-compose up -d frontend

docker-compose down

docker volume rm gptutor-infrastructure_www-html

docker-compose stop nginx
docker-compose rm --force nginx

docker-compose build nginx
docker-compose up -d nginx

sh deploy-all.sh

