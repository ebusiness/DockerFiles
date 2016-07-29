FROM java:openjdk-8-alpine
MAINTAINER Wang Xinguang <wangxinguang@e-business.co.jp>

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.0.36
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

COPY ARIALUNI.TTF /root/arialuni.ttf
RUN apk add --update --no-cache \
    ttf-dejavu \
		ca-certificates \
		openssl && \
    mkdir /usr/share/fonts/TTF && \
    mv /root/arialuni.ttf /usr/share/fonts/TTF/arialuni.ttf && \
    cd /usr/share/fonts/TTF && \
    mkfontdir && \
    wget -qO- ${TOMCAT_TGZ_URL} | tar xvz -C /usr/local && \
    ln -s /usr/local/apache-tomcat-${TOMCAT_VERSION} ${CATALINA_HOME} && \
    apk del ca-certificates openssl

WORKDIR ${CATALINA_HOME}

EXPOSE 8080

CMD ["catalina.sh", "run"]
