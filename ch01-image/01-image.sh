#! /bin/bash

# 搜索镜像
docker search java

# 获取镜像
# docker pull [选项] [Docker Registry 地址[:端口号]/]仓库名[:标签]
docker pull ubuntu:16.04

# 运行镜像
docker run -it --rm ubuntu:16.04 bash
# -i ：交互式操作，
# -t ：终端。我们这里打算进入 bash 执行一些命令并查看返回结果，因此我们需要交互式终端
# --rm ：这个参数是说容器退出后随之将其删除。默认情况下，为了排障需求，退出的容器并不会立即删除，除非手动 docker rm 。我们这里只是随便执行个命令，看看结果， 不需要排障和保留结果，因此使用 --rm 可以避免浪费空间。

# 列出已安装docker
docker image ls
# 列出所用镜像
docker image ls -a
# 查看空悬镜像
docker image ls -f dangling=true
#列出部分镜像
docker image ls ubuntu
docker image ls ubuntu:16.04
docker image ls -f since=mongo:3.2
docker image ls -f label=com.example.version=0.1

# 镜像体积
docker system df

# 删除虚悬镜像
docker image prune

# 删除本地镜像
# docker image rm [选项] <镜像1> [<镜像2> ...]

docker image rm ab5 #使用镜像ID前缀
docker image rm centos # 使用镜像名

docker rmi hello-world
docker rmi -f $(docker imgages)
#docker image rm [选项] <镜像1> [<镜像2> ...]


# 构建镜像
# docker build [选项] <上下文路径/URL/->
docker build -t nginx:v3 .