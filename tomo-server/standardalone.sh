#!/bin/sh


# webhook
docker run -d --restart=always --name webhook -p 9000:9000 -v $(pwd)/config.json:/config.json -v /var/run/docker.sock:/var/run/docker.sock starboychina/webhook

# lego

# docker run -it --rm -p 80:80 -v /home/ec2-user/ssl/.lego:/.lego  xenolf/lego --email="admin@genbatomo.com" --domains="api.genbatomo.com" --domains="admin.genbatomo.com" --accept-tos run

# docker run -it --rm -p 80:80 -v /home/ec2-user/ssl/.lego:/.lego  xenolf/lego --email="admin@genbatomo.com" --domains="api.genbatomo.com" --domains="admin.genbatomo.com" renew

# ln -s /home/ec2-user/ssl/.lego/certificates /certificates

# mongodb
docker run -d --restart=always --name mongo -p 27017:27017 mvertes/alpine-mongo


# redis
docker run -d --restart=always --name redis -p 6379:6379 redis:alpine


# tomo
docker run -d --restart=always --name tomo -p 443:443 -v $(pwd)/global.js:/global.js -v $(pwd)/certificates:/certificates -v $(pwd)/apn:/apn --link mongo:mongo --link redis:redis -e NODE_ENV=production ebusinessdocker/tomo
# docker run -it --rm -p 443:443 -v $(pwd)/global.js:/global.js -v $(pwd)/certificates:/certificates -v $(pwd)/apn:/apn --link mongo:mongo --link redis:redis -e NODE_ENV=production ebusinessdocker/tomo sh
