#!/bin/sh
if [[ ! -d /ebusiness ]]; then
  mkdir /ebusiness
  cd /ebusiness
  git clone https://github.com/ebusiness/ebusiness.git ./

fi

cd /ebusiness

git checkout -- employee/settings.py
git pull

# settings

if [ ${MYSQL_SERVER}x == ""x ]; then
  MYSQL_SERVER=172.17.0.1
fi
echo "Mysql server:" ${MYSQL_SERVER}

FILENAME=/ebusiness/employee/settings.py
mv ${FILENAME} ${FILENAME}.bak
sed "s/'HOST'.*/'HOST':'${MYSQL_SERVER}',/g" ${FILENAME}.bak >${FILENAME}
rm ${FILENAME}.bak

if [ ${MYSQL_USER}x != ""x ]; then
  mv ${FILENAME} ${FILENAME}.bak
  sed "s/'USER'.*/'USER':'${MYSQL_USER}',/g" ${FILENAME}.bak >${FILENAME}
  rm ${FILENAME}.bak
fi

if [ ${MYSQL_PASSWORD}x != ""x ]; then
  mv ${FILENAME} ${FILENAME}.bak
  sed "s/'PASSWORD'.*/'PASSWORD':'${MYSQL_PASSWORD}',/g" ${FILENAME}.bak >${FILENAME}
  rm ${FILENAME}.bak
fi


if [[ ! -d log ]]; then
  mkdir log
fi

if [[ ! -d log/batch ]]; then
  mkdir log/batch
fi

python manage.py makemigrations eb
python manage.py migrate eb

nohup python batch.py &
python manage.py runserver 0.0.0.0:80 --noreload
