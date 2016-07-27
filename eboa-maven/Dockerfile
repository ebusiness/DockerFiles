FROM java:openjdk-8-alpine
MAINTAINER Wang Xinguang <wangxinguang@e-business.co.jp>

ENV MAVEN_VERSION 3.3.9

COPY enterpoint.sh /root/enterpoint.sh

RUN apk add --update --no-cache git curl && \
  git config --global credential.helper store && \
  chmod +x /root/enterpoint.sh && \

  mkdir -p /usr/share/maven && \
  wget http://ftp.jaist.ac.jp/pub/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  tar -xzvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  rm -rf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  mv apache-maven-$MAVEN_VERSION/* /usr/share/maven/ && \
  rm -rf apache-maven-$MAVEN_VERSION && \
  ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

VOLUME /root/.m2

ENTRYPOINT ["/root/enterpoint.sh"]
