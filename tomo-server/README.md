# certbot

- 启动docker

```sh
sh standardlone.sh
```

# 备注

如需要定制容器 可以参考Dockerfile

```sh
docker build --tag ebusinessdocker/tomo .
```


# mongo

备份与恢复

```sh
# 安装 mongodump, mongorestore
docker exec -it mongo sh -c 'apk add --no-cache mongodb-tools'

# backup
docker exec -it mongo sh -c 'cd && mongodump'
docker cp mongo:/root/dump $(pwd)/mongodump

# restore
docker cp $(pwd)/mongodump mongo:/root/dump
docker exec -it  mongo sh -c 'cd && mongorestore dump'

```
