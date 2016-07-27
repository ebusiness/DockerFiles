# sales

- 启动docker

```sh
  docker run -d -p 8080:80 --name sales --restart=always ebusinessdocker/sales
```

# 备注
如需要定制容器 可以参考Dockerfile

```sh
docker build --tag ebusinessdocker/sales .
```
