# eboa-monit

- 启动docker

```sh
docker run -d -p 2812:2812 -v $(pwd)/tomcat.cfg:/etc/monit/conf.d/tomcat.cfg -v /var/run/docker.sock:/var/run/docker.sock ebusinessdocker/eboa-monit
```

# 备注
如需要定制容器 可以参考Dockerfile

```sh
docker build --tag ebusinessdocker/eboa-monit .
```
