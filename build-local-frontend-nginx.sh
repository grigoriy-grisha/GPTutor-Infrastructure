#!/bin/sh

sh .env.sh

docker volume rm gptutor_www-html

docker-compose -f docker-compose-dev-nginx.yaml stop frontend
docker-compose -f docker-compose-dev-nginx.yaml rm --force frontend

docker-compose -f docker-compose-dev-nginx.yaml build --no-cache frontend
docker-compose -f docker-compose-dev-nginx.yaml up -d frontend

docker-compose -f docker-compose-dev-nginx.yaml stop nginx
docker-compose -f docker-compose-dev-nginx.yaml rm --force nginx

docker-compose -f docker-compose-dev-nginx.yaml  build  nginx
docker-compose -f docker-compose-dev-nginx.yaml up -d nginx
