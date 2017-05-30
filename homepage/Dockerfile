
FROM node:7-alpine
MAINTAINER Wang Xinguang <wangxinguang@e-business.co.jp>

ENV SOURCE_PATH /root/e-business
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

WORKDIR /root/e-business
VOLUME /root/e-business
VOLUME /ssl
EXPOSE 80 443

ENTRYPOINT ["sh","-c", "/entrypoint.sh"]

#docker build -t ebusinessdocker/home .
