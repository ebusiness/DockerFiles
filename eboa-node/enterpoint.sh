#!/bin/sh
#
rm -rf /root/.git-credentials
echo https://${GIT_USER}:${GIT_PASSWORD}@e-business.co.jp:3000 >/root/.git-credentials

if [[ ! -d /oautil ]]; then
  git clone https://e-business.co.jp:3000/OA_Group/oautil.git

  BEFORE=localhost
  if [ ${MYSQL_SERVER}x == ""x ]; then
    MYSQL_SERVER=172.17.0.1
  fi
  echo "Mysql server:" ${MYSQL_SERVER}

  FILENAME=/oautil/config/env.js
  mv ${FILENAME} ${FILENAME}.bak
  sed "s/${BEFORE}/${MYSQL_SERVER}/g" ${FILENAME}.bak >${FILENAME}
  rm ${FILENAME}.bak

  if [ ${MYSQL_USER}x != ""x ]; then
    mv ${FILENAME} ${FILENAME}.bakforuser
    sed "s/user.*/user:'${MYSQL_USER}',/g" ${FILENAME}.bakforuser >${FILENAME}
    rm ${FILENAME}.bakforuser
  fi

  if [ ${MYSQL_PASSWORD}x != ""x ]; then
    mv ${FILENAME} ${FILENAME}.bakforpassword
    sed "s/password.*/password:'${MYSQL_PASSWORD}',/g" ${FILENAME}.bakforpassword >${FILENAME}
    rm ${FILENAME}.bakforpassword
  fi

  if [ ${MYSQL_DATABASE}x != ""x ]; then
    mv ${FILENAME} ${FILENAME}.bakfordatabase
    sed "s/database.*/database:'${MYSQL_DATABASE}',/g" ${FILENAME}.bakfordatabase >${FILENAME}
    rm ${FILENAME}.bakfordatabase
  fi
fi

cd /oautil

git pull && npm install && npm start > npm.log
