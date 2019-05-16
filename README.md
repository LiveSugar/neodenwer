# NEODENWER

![License](https://img.shields.io/github/license/livesugar/neodenwer.svg?style=popout)
![Docker Pulls](https://img.shields.io/docker/pulls/andreybuturlakin/neodenwer.svg?style=popout)
![Docker Stars](https://img.shields.io/docker/stars/andreybuturlakin/neodenwer.svg?style=popout)
![Docker Layers](https://img.shields.io/microbadger/layers/andreybuturlakin/neodenwer.svg?style=popout)
![Docker Image Size](https://img.shields.io/microbadger/image-size/andreybuturlakin/neodenwer/latest.svg?style=popout)
![Docker Build](https://img.shields.io/docker/cloud/build/andreybuturlakin/neodenwer.svg)

If need get passing build image go to [Docker Hub](https://hub.docker.com/r/andreybuturlakin/neodenwer)


## Basic Usage

It is Build
```
root# ./make
```

It is Run
```
root# docker run -dt -p 127.0.0.100:80:80 -p 127.0.0.100:81:81 -p 127.0.0.100:82:82 -p 127.0.0.100:83:8529 -p 127.0.0.100:85:85 -v `pwd`/app:/webserver --restart=unless-stopped  andreybuturlakin/neodenwer:latest /usr/sbin/start
```

## Create New Project

Create Dockerfile
```
FROM andreybuturlakin/neodenwer:latest
CMD /usr/sbin/start
```

Create shell file power.sh
```
#!/bin/sh -e

NAME=you_name_project
VERSION=v1.0
ID=`docker container ls | grep  ${NAME}:${VERSION} | awk '{print $1}'`

if [ -z "$ID" ]
then
  docker build -t ${NAME}:${VERSION} .
else
  docker container stop ${ID}
  docker container rm ${ID}
fi

docker run -dt -p 127.0.0.1:80:80 -p 127.0.0.1:81:81 -p 127.0.0.1:82:82 -p 127.0.0.1:83:8529 -p 127.0.0.1:85:85 -v `pwd`/app:/webserver --restart=unless-stopped  ${NAME}:${VERSION} /usr/sbin/start
```


