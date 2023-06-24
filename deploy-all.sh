

sh .env.sh

cd ./GPTutor-Frontend || exit
git pull

cd ../

cd ./GPTutor-Backend || exit
git pull

cd ../

docker-compose down
docker-compose build
docker-compose up -d