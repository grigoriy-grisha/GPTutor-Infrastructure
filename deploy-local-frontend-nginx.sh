#!/bin/sh

sh .env.sh

cp ./.env-frontend ./GPTutor-Frontend/.env

docker-compose -f docker-compose-dev-nginx.yaml stop frontend
docker-compose -f docker-compose-dev-nginx.yaml rm --force frontend

docker-compose -f docker-compose-dev-nginx.yaml build frontend
docker-compose -f docker-compose-dev-nginx.yaml up -d frontend

docker-compose -f docker-compose-dev-nginx.yaml stop nginx
docker-compose -f docker-compose-dev-nginx.yaml rm --force nginx

docker-compose -f docker-compose-dev-nginx.yaml build nginx
docker-compose -f docker-compose-dev-nginx.yaml up -d nginx
