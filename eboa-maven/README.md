# eboa-maven

- 创建工作目录

该目录将存放编译后的 war 文件(eboa.war)

```sh
  mkdir /workspace
```

- 启动docker

```sh
  docker run -d --name maven -v /workspace:/workspace -e GIT_USER=gitusername -e GIT_PASSWORD=gitpassword -e MYSQL_SERVER=server ebusinessdocker/eboa-maven
```

# 备注
如需要定制容器 可以参考Dockerfile

```sh
docker build --tag ebusinessdocker/eboa-maven .
```
