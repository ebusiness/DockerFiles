FROM node:7.4.0-alpine

# Maintainer
MAINTAINER Wangxinguang <wangxinguang@e-business.co.jp>

# Environments
ENV TIMEZONE            Asia/Tokyo

COPY enterpoint.sh /enterpoint.sh


RUN chmod +x /enterpoint.sh && \

    apk update && apk add git tzdata && \

  	cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
  	echo "${TIMEZONE}" > /etc/timezone && \

    rm -rf /var/cache/apk/*


EXPOSE 80 443

ENTRYPOINT ["/enterpoint.sh"]
