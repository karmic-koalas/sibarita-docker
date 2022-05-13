#!/bin/sh

docker-compose down &&
for image in $(docker-compose images -q)
do
docker image rm $image
done

docker-compose build --force-rm --no-cache && docker-compose up --detach && docker-compose logs -f
