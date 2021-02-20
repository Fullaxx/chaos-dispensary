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

## Using curl to retrieve numbers
By default the output will be a space delimited string of numbers. \
If the header <code>Accept: application/json</code> is sent, the output will be json. \
Get 1 number from the dispensary:
```
curl http://172.17.0.1:8080/chaos/1
curl -H "Accept: application/json" http://172.17.0.1:8080/chaos/1
```
Get 10 numbers from the dispensary:
```
curl http://172.17.0.1:8080/chaos/10
curl -H "Accept: application/json" http://172.17.0.1:8080/chaos/10
```
Get 99999 numbers from the dispensary:
```
curl http://172.17.0.1:8080/chaos/99999
curl -H "Accept: application/json" http://172.17.0.1:8080/chaos/99999
```

## Using curl to check status
The status node consists of two values. \
<code>Chaos/s</code> is the amount of chaos pouches that we're processing per second. \
<code>Numbers/s</code> is the amount of random numbers we're generating per second.
```
curl http://172.17.0.1:8080/status/
curl -H "Accept: application/json" http://172.17.0.1:8080/status/
```
