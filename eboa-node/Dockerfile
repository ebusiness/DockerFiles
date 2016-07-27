FROM mhart/alpine-node-auto:latest
MAINTAINER Wang Xinguang <wangxinguang@e-business.co.jp>

COPY enterpoint.sh /root/enterpoint.sh

RUN apk --update --no-progress add git && \
  git config --global credential.helper store && \
  chmod +x /root/enterpoint.sh && \
  rm -rf /var/cache/apk/*

ENTRYPOINT ["/root/enterpoint.sh"]

# docker run -it --rm -p 3000:3000  -e GIT_USER=gitusername -e GIT_PASSWORD=gitpassword -e MYSQL_SERVER=172.17.0.1 -e MYSQL_USER=root -e MYSQL_PASSWORD=eb2016 ebusinessdocker/eboa-node sh
