#!/bin/sh

sudo service docker start

docker build -t sehattor/nxing:v1 ./srcs/requirements/nginx/
docker build -t sehattor/wordpress:v1 ./srcs/requirements/wordpress/
docker build -t sehattor/mariadb:v1 ./srcs/requirements/mariadb/

docker-compose -f ./srcs/docker-compose.yml up -d