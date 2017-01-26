#!/bin/sh


# webhook
docker run -d --restart=always --name webhook -p 9000:9000 -v $(pwd)/config.json:/config.json -v /var/run/docker.sock:/var/run/docker.sock starboychina/webhook

# lego

# mongodb
docker run -d --restart=always --name mongo -p 27017:27017 mvertes/alpine-mongo


# redis
docker run -d --restart=always --name redis -p 6379:6379 redis:alpine


# tomo
docker run -d --restart=always --name tomo -p 443:443 -v $(pwd)/global.js:/global.js -v $(pwd)/certificates:/certificates --link mongo:mongo --link redis:redis ebusinessdocker/tomo
# docker run -it --rm --name tomo -p 443:443 -v $(pwd)/global.js:/global.js -v $(pwd)/certificates:/certificates --link mongo:mongo --link redis:redis ebusinessdocker/tomo sh
