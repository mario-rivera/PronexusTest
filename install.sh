#!/bin/bash
PWD=$(pwd)
SCRIPT_WORKDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
BASENAME_LOWER=$(basename $SCRIPT_WORKDIR | tr '[:upper:]' '[:lower:]')

NETNAME=dev

APP_IMAGE_NAME=hello-dutch
APP_CONTAINER_NAME=hello-dutch-web
MYSQL_CONTAINER_NAME=hello-dutch-mysql

create_network_ifnotexists(){
    # -z is if output is empty
    if [ -z "$(docker network ls | grep $1)" ]; then
        docker network create $1
        echo "Network $1 created"
    fi
}

install(){
    build_image
    create_network_ifnotexists $NETNAME;

    composer

    mysql_up
    web_up
}

build_image(){

    docker build -t $APP_IMAGE_NAME $SCRIPT_WORKDIR/docker/php
}

composer() {

    docker run -it --rm -v $SCRIPT_WORKDIR:/var/www $APP_IMAGE_NAME bash -c "composer install"
}

mysql_up() {

    docker run -d --network=$NETNAME \
    --name $MYSQL_CONTAINER_NAME \
    -e MYSQL_ROOT_PASSWORD=root \
    -e MYSQL_DATABASE=hellodutch \
    -v $SCRIPT_WORKDIR/docker/mariadb/initdb:/docker-entrypoint-initdb.d \
    -p 3306:3306 \
    mariadb:10.3
}

web_up(){

    docker run -d --name $APP_CONTAINER_NAME -p 9999:80 --network=$NETNAME -v $SCRIPT_WORKDIR:/var/www $APP_IMAGE_NAME
}

destroy(){

    docker stop $APP_CONTAINER_NAME && docker rm $APP_CONTAINER_NAME
    docker stop $MYSQL_CONTAINER_NAME && docker rm $MYSQL_CONTAINER_NAME
    docker network rm $NETNAME
    docker rmi $APP_IMAGE_NAME
}

$1
