FROM centos:7
MAINTAINER Wang Xinguang <wangxinguang@e-business.co.jp>

ENV JAVA_HOME /usr/java/latest
ENV PATH $PATH:$JAVA_HOME/jre/bin:$JAVA_HOME/bin

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

ENV JAVA_VERSION 8u31
ENV BUILD_VERSION b13
ENV JDK_URL http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.rpm


ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.0.36
ENV TOMCAT_TGZ_URL https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

ENV JAVA_OPTS "-Doffice.home=/opt/openoffice4"

COPY enterpoint.sh /enterpoint.sh
COPY ARIALUNI.TTF /root/arialuni.ttf

RUN chmod +x /enterpoint.sh && \
    mkdir /upload && \
    ln -s /upload /root/C:\\Programs\\bpm\\bpm\\bpm_file && \
    mkdir /webapps && \
    mkdir /usr/share/fonts && \
    cd /usr/share/fonts && \
    mv /root/arialuni.ttf /usr/share/fonts/ && \
    rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    yum install -y wget mkfontscale fontconfig libXext && \
    yum clean all && \
    fc-cache -fv

WORKDIR /root

EXPOSE 8080

ENTRYPOINT ["/enterpoint.sh"]
