

sh .env.sh

cd ./GPTutor-Frontend || exit
git pull

cd ../

cd ./GPTutor-Backend || exit
git pull

cd ../

docker-compose down
docker-compose build

docker-compose up -d frontend
docker-compose up -d frontend-stage

docker-compose up -d nginx

docker-compose up -d postgresql
docker-compose up -d postgresql-stage

docker-compose up -d certbot
docker-compose up -d certbot-stage

docker-compose up -d backend
docker-compose up -d backend-stage