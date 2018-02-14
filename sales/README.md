# sales

- 启动docker

```sh
  docker run -d -p 8080:80 --name sales --restart=always ebusinessdocker/sales
```

docker run -d --name sales --link mysql:mysql -v /home/ec2-user/build/eb_sales_files:/eb_sales_files yangwanjun/sales

# 备注
如需要定制容器 可以参考Dockerfile

```sh
docker build --tag ebusinessdocker/sales .
```
