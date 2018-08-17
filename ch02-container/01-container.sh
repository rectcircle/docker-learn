#! /bin/bash

# 新建并启动容器
# docker run
# -d 后台运行
# -P 随机端口映射
# -p 指定端口映射
#   ip:hostPort:containPort
#   ip::containPort
#   hostPort:containPort
#   containPort
# --network 网络模式
#   --network=bridge 默认：网桥
#   --network=host
#   --network=containter:NAME_or_ID
#   --network=none
# -i 交互式操作
# -t 终端
# --mount 或 -v
#   `-v /src/webapp:/opt/webapp` 格式：` 本机目录:容器内目录`
#   `--mount type=bind,source=/src/webapp,target=/opt/webapp`
#   `-v /src/webapp:/opt/webapp:ro` 只读
#   `--mount type=bind,source=/src/webapp,target=/opt/webapp,readonly` 只读
# --rm 这个参数是说容器退出后随之将其删除。默认情况下，为了排障需求，退出的容器并不会立即删除，除非手动 docker rm

docker run java /bin/echo 'hello world' #等价于直接运行echo 'hello world'
docker run -d -p 91:80 nginx

# 列出容器
docker ps

# 停止容器
docker stop [CONTAINER ID]

# 强行停止容器
docker kill [CONTAINER ID]

# 启动已停止
docker start [CONTAINER ID]

# 重启容器
docker restart [CONTAINER ID]

# 进入容器
# 方式1
docker attach [CONTAINER ID]
# 方式2
docker ps
docker inspect --format "{{.State.Pid}}" [CONTAINER ID]
nsenter --target [PID] --mount --uts --ipc --net --pid
# 方式3
#宿主机为windows
winpty docker exec -it [CONTAINER ID] bash
#宿主机为Linux
docker exec -it [CONTAINER ID] bash

# 删除所有容器
docker rm $(docker ps -a -q)
docker container prune


# 导入导出容器快照
# 导出
docker ps -a
docker export 7691a814370e > ubuntu.tar

# 导入容器快照
cat ubuntu.tar | docker import - test/ubuntu:v1.0
docker import http://example.com/exampleimage.tgz example/imagerepo


# 创建数据卷
docker volume create my-vol

# 查看数据卷
docker volume ls

# 查看容器信息
docker inspect [OPTIONS] NAME|ID [NAME|ID...]

# 删除数据卷
docker volume rm my-vol

# 删除无主数据卷
docker volume prune