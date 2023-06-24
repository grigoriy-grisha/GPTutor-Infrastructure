#!/bin/sh

sh .env.sh

cp ./.env-frontend ./GPTutor-Frontend/.env

docker-compose -f docker-compose-dev.yaml stop frontend
docker-compose -f docker-compose-dev.yaml rm --force frontend

docker-compose -f docker-compose-dev.yaml build frontend
docker-compose -f docker-compose-dev.yaml up -d frontend


