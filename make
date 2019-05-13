#!/bin/sh
NAME=neodenwer
VERSION=v1.0
ID=`docker container ls | grep  ${NAME}:${VERSION} | awk '{print $1}'`

docker build -t ${NAME}:${VERSION} .
docker container stop ${ID}
docker container rm ${ID}
docker run -dt -p 127.0.0.100:80:80 -p 127.0.0.100:81:81 -p 127.0.0.100:82:82 -p 127.0.0.100:83:8529 -p 127.0.0.100:85:85 -v `pwd`/app:/webserver --restart=unless-stopped  ${NAME}:${VERSION} /usr/sbin/start
