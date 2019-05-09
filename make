#!/bin/sh
NAME=neodenwer
VERSION=v1.1
ID=`docker container ls | grep  ${NAME}:${VERSION} | awk '{print $1}'`

docker build -t ${NAME}:${VERSION} .
docker container stop ${ID}
docker container rm ${ID}
docker run -dt -p 80:80 -v `pwd`/app:/webserver --restart=unless-stopped  ${NAME}:${VERSION} /usr/sbin/start
