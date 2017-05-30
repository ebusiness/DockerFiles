#!/bin/sh

if [[ ! -d ${SOURCE_PATH}/.git ]]; then
  apk --update --no-progress add git
  rm -rf /tmp/* /var/cache/apk/*
  mkdir ${SOURCE_PATH}
  cd ${SOURCE_PATH}

  git clone https://github.com/ebusiness/e-business.git ./
  #  git init .
  #  git remote add -t \* -f origin https://github.com/ebusiness/e-business.git
  #  git checkout master

  npm install bower -g
  npm install gulp -g
  bower install --allow-root
  sed -i '1i var punchgs = window.GreenSockGlobals;' ${SOURCE_PATH}/public/components/revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js
fi

if ! command -v bower >/dev/null; then
  echo "install bower"
  npm install bower -g
fi

if ! command -v gulp >/dev/null; then
  echo "install gulp"
  npm install gulp -g
fi

git checkout .

cp -p /ssl/cert.pem ${SOURCE_PATH}/resources/cert.pem
cp -p /ssl/key.pem ${SOURCE_PATH}/resources/key.pem

npm install
bower install --allow-root
gulp
npm start > npm.log
