

sh .env.sh

cd ./GPTutor-Frontend || exit
git checkout main
git pull

cd ../

cd ./GPTutor-Backend || exit

git checkout main
git pull

cd ../

docker-compose down

docker-compose up -d frontend
docker-compose up -d nginx
docker-compose up -d postgresql
docker-compose up -d backend
docker-compose up -d certbot

sh .env-stage.sh

cd ./GPTutor-Frontend || exit
git switch origin/develop
git pull


cd ./GPTutor-Backend || exit
git switch origin/develop
git pull

cd ../

docker-compose up -d frontend-stage
docker-compose up -d postgresql-stage
docker-compose up -d backend-stage
docker-compose up -d certbot-stage


