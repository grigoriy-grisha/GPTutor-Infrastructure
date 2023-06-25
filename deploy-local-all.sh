sh .env.sh

cd ./GPTutor-Frontend || exit
npm i
npm run start
cd ../

docker-compose -f docker-compose-dev.yaml down postgresql
docker-compose -f docker-compose-dev.yaml build postgresql
docker-compose -f docker-compose-dev.yaml up -d postgresql

docker-compose -f docker-compose-dev.yaml down backend
docker-compose -f docker-compose-dev.yaml build backend
docker-compose -f docker-compose-dev.yaml up -d backend
