FROM alpine:latest
MAINTAINER Wang Xinguang <wangxinguang@e-business.co.jp>

RUN apk add --no-cache openjdk8
ENV JAVA8_HOME /usr/lib/jvm/default-jvm
ENV JAVA_HOME $JAVA8_HOME

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.0.32
ENV TOMCAT_USERS_FILE /usr/local/apache-tomcat-${TOMCAT_VERSION}/conf/tomcat-users.xml
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin

RUN wget -qO- "${TOMCAT_TGZ_URL}/apache-tomcat-${TOMCAT_VERSION}.tar.gz" | tar xvz -C /usr/local

RUN ln -s /usr/local/apache-tomcat-${TOMCAT_VERSION} ${CATALINA_HOME}

EXPOSE 8080

ENTRYPOINT /usr/local/tomcat/bin/startup.sh && /bin/sh
