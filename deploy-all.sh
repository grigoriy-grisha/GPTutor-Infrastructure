

sh .env.sh

cd ./GPTutor-Frontend || exit
git checkout main
git pull

cd ../

cd ./GPTutor-Backend || exit

git checkout main
git pull

cd ../

docker-compose stop  frontend
docker-compose rm --force frontend

docker-compose build frontend
docker-compose up -d frontend

docker-compose down

docker volume rm gptutor-infrastructure_www-html
docker volume rm gptutor-infrastructure_www-html-stage

docker-compose up -d frontend
docker-compose up -d nginx
docker-compose up -d postgresql
docker-compose up -d backend
docker-compose up -d certbot

sh .env-stage.sh

cd ./GPTutor-Frontend || exit
git checkout origin/develop
git pull origin develop

cd ../

cd ./GPTutor-Backend || exit
git checkout origin/develop
git pull origin develop

cd ../

docker-compose stop  frontend-stage
docker-compose rm --force frontend-stage

docker-compose build frontend-stage
docker-compose up -d frontend-stage


docker-compose up -d frontend-stage
docker-compose up -d postgresql-stage
docker-compose up -d backend-stage
docker-compose up -d certbot-stage


