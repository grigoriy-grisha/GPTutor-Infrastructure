

sh .env.sh

cd ./GPTutor-Frontend || exit
git pull

cd ../

cd ./GPTutor-Backend || exit
git pull

cd ../

docker-compose down
docker-compose build

docker-compose up frontend -d
docker-compose up frontend-stage -d

docker-compose up nginx -d

docker-compose up postgresql -d
docker-compose up postgresql-stage -d

docker-compose up certbot -d
docker-compose up certbot-stage -d

docker-compose up backend -d
docker-compose up backend-stage -d