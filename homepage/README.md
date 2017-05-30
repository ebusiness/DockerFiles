# homepage

- 启动docker

```sh
docker run -d --restart=always --name=homepage -p 80:80 -p 443:443 -v ~/ssl/:/ssl/ ebusinessdocker/home
```

- 开发

```sh
docker run -it --name=homepage -p 80:80 -p 443:443 -v ~/ssl/:/ssl/ -v ~/sources_path:/root/e-business ebusinessdocker/home
```

# 备注
如需要定制容器 可以参考Dockerfile

```sh
docker build --tag ebusinessdocker/home .
```
