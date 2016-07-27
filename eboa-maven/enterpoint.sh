#!/bin/sh
#

rm -rf /root/.git-credentials
echo https://${GIT_USER}:${GIT_PASSWORD}@e-business.co.jp:3000 >/root/.git-credentials

if [[ ! -d /BPM ]]; then
  git clone https://e-business.co.jp:3000/OA_Group/BPM.git
fi

BEFORE=localhost
FILENAME=/BPM/src/main/resources/cust/eboa.properties

if [ ${MYSQL_SERVER}x == ""x ]; then
  MYSQL_SERVER=172.17.0.1
fi

echo "Mysql server:" ${MYSQL_SERVER}

mv ${FILENAME} ${FILENAME}.bak
sed "s/${BEFORE}/${MYSQL_SERVER}/g" ${FILENAME}.bak >${FILENAME}


cd /BPM

git pull

mvn package

if [[ -d /workspace ]]; then
  mv /BPM/target/*.war /workspace/eboa.war
fi

rm ${FILENAME}
mv ${FILENAME}.bak ${FILENAME}
