![License](https://img.shields.io/github/license/livesugar/neodenwer.svg?style=popout)
![Docker Pulls](https://img.shields.io/docker/pulls/andreybuturlakin/neodenwer.svg?style=popout)
![Docker Stars](https://img.shields.io/docker/stars/andreybuturlakin/neodenwer.svg?style=popout)
![Docker Layers](https://img.shields.io/microbadger/layers/andreybuturlakin/neodenwer.svg?style=popout)
![Docker Image Size](https://img.shields.io/microbadger/image-size/andreybuturlakin/neodenwer/latest.svg?style=popout)
![Docker Build Automated](https://img.shields.io/docker/automated/andreybuturlakin/neodenwer.svg)

[Docker Hub](https://hub.docker.com/r/andreybuturlakin/neodenwer)

# It is Build

```
root# ./make
```

# It is Run

```
root# docker run -dt -p 127.0.0.100:80:80 -p 127.0.0.100:81:81 -p 127.0.0.100:82:82 -p 127.0.0.100:83:8529 -p 127.0.0.100:85:85 -v `pwd`/app:/webserver --restart=unless-stopped  andreybuturlakin/neodenwer:latest /usr/sbin/start
```
