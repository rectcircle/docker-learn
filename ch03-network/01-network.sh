#! /bin/bash

# 端口映射
# docker run -p [ip:hostPort:containerPort | ip::containerPort | hostPort:containerPort]
# 当使用 -P 标记时，Docker 会随机映射一个 49000~49900 的端口到内部容器开放的网络端口。
docker run -d -P training/webapp python app.py
# 查看映射
docker ps -l1
docker logs -f nostalgic_morse
# 映射所有地址
docker run -d -p 5000:5000 training/webapp python app.py
# 映射localhost
docker run -d -p 127.0.0.1:5000:5000 training/webapp python app.py
docker run -d -p 127.0.0.1::5000 training/webapp python app.py
# 查看端口映射
docker port nostalgic_morse 5000


# 创建一个网络
docker network create -d bridge my-net # 创建一个网桥型网络
#运行一个容器并连接到该网络
docker run -it --rm --name busybox1 --network my-net busybox sh
docker run -it --rm --name busybox2 --network my-net busybox sh
# 在busybox1内执行 ping busybox2
# 如果你有多个容器之间需要互相连接，推荐使用 Docker Compose


# 配置主机名和DNS
# docker配置文件：`/etc/docker/daemon.json`
# 运行时指定使用docker run -h HOSTNAME --dns=IP_ADDRESS --dns-search=DOMAIN

