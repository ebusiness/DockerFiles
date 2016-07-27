# sales

- 启动docker

```sh
docker run -d -p 3000:3000 --restart=always --name=eboa  -e MYSQL_SERVER=mysqlserver -e MYSQL_USER=mysqluser -e MYSQL_PASSWORD=mysqlpassword  -e GIT_USER=gitusername -e GIT_PASSWORD=gitpassword -e NODE_ENV=production ebusinessdocker/eboa-node

```

# 备注
如需要定制容器 可以参考Dockerfile

```sh
docker build --tag ebusinessdocker/eboa-node .
```
