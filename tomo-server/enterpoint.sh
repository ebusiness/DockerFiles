#!/bin/sh

# tomo
if [[ ! -d /tomo-server ]]; then
  mkdir /tomo-server
  cd /tomo-server
  git clone https://github.com/ebusiness/tomo-server.git ./
  npm install
fi

cd /tomo-server

git checkout -- config/global.js
git pull

if [[ -f /global.js ]]; then
  echo 'change global.js'
  rm -rf /tomo-server/config/global.js
  cp /global.js /tomo-server/config/global.js
fi

npm start
