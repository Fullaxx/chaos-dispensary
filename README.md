[![Build Status](https://travis-ci.com/Fullaxx/CHAOSgen.svg?branch=master)](https://travis-ci.com/Fullaxx/CHAOSgen)

# chaos-dispensary
A web service that dispenses random numbers built from
* [redis](https://redis.io/)
* [CHAOSgen](https://github.com/Fullaxx/CHAOSgen)

## Base Docker Image
[Debian](https://hub.docker.com/_/debian) buster-slim (x64)

## Get the image from Docker Hub or build it yourself
```
docker pull fullaxx/chaos-dispensary
docker build -t="fullaxx/chaos-dispensary" github.com/Fullaxx/chaos-dispensary
```

## Launch chaos-dispensary docker container
Run chaos-dispensary binding to 172.17.0.1:80
```
docker run -d -p 172.17.0.1:80:8080 fullaxx/chaos-dispensary
```
