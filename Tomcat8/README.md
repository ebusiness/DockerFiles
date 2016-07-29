# openjdk-tomcat

- 创建工作目录

```sh
  mkdir /workspace
```

- 复制war包到工作目录下

```sh
  mv xxx.war /workspace/
```
- 启动docker

```sh
  docker run -d -p 8080:8080 --name tomcat --restart=always -v /workspace:/usr/local/tomcat/webapps ebusinessdocker/tomcat
```

- war解包

  等待一段时间

- 验证

  打开192.168.99.100:8080/xxx

完毕

# 备注
如需要定制容器 可以参考Dockerfile

```sh
docker build --tag ebusinessdocker/tomcat .
```
