#!/bin/sh

if [[ ! -d $JAVA_HOME ]]; then
  wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" $JDK_URL -O /tmp/jdk-8-linux-x64.rpm
  yum -y install /tmp/jdk-8-linux-x64.rpm
  # yum -y install /root/workspace/jdk-8-linux-x64.rpm
  rm /tmp/jdk-8-linux-x64.rpm
fi
if [[ ! -d $CATALINA_HOME ]]; then
  wget --no-cookies --no-check-certificate ${TOMCAT_TGZ_URL}
  tar zxvf apache-tomcat-${TOMCAT_VERSION}.* -C /usr/local/
  # tar zxvf /root/workspace/apache-tomcat-${TOMCAT_VERSION}.tar.gz -C /usr/local/
  rm apache-tomcat*
  ln -s /usr/local/apache-tomcat-${TOMCAT_VERSION} ${CATALINA_HOME}
  # ln -s /upload /usr/local/tomcat/C:\\Programs\\bpm\\bpm\\bpm_file
  rm -rf /usr/local/tomcat/webapps
  ln -s /webapps /usr/local/tomcat/webapps
  # cp /root/workspace/eboa.war /usr/local/tomcat/webapps/
fi
if [[ ! -d /opt/openoffice4 ]]; then
  openofficeURL=http://jaist.dl.sourceforge.net/project/openofficeorg.mirror/4.1.2/binaries/en-US/Apache_OpenOffice_4.1.2_Linux_x86-64_install-rpm_en-US.tar.gz
  wget --no-cookies --no-check-certificate $openofficeURL
  tar xvzf Apache_OpenOffice_4.1.2_Linux_x86-64_install-rpm_en-US.tar.gz -C /tmp/
  # tar xvzf /root/workspace/Apache_OpenOffice_4.1.2_Linux_x86-64_install-rpm_en-US.tar.gz -C /tmp/
  rm Apache_OpenOffice*
  rpm -ivh  /tmp/en-US/RPMS/*.rpm
  rm -rf /tmp/*
  yum groupinstall -y "X Window System"
  yum clean all
fi

catalina.sh run
