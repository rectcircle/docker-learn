# docker学习实验

> 参考：
> [《Docker —— 从入门到实践》](https://github.com/yeasy/docker_practice)
> [个人博客](https://www.rectcircle.cn/detail/151)

## 章节1：镜像

### 01：镜像命令
`ch01-image/01-image.sh`


### 02：使用 Dockerfile 定制镜像

#### 01：简单例子
`ch01-image/02-Dockerfile/01-mynginx`

```bash
cd ch01-image/02-Dockerfile/01-mynginx
docker build -t mynginx:v1 .
docker run -p 80:80 --rm mynginx:v1
docker stop $(docker ps -a -q)
```

#### 02：最小化镜像
`ch01-image/02-Dockerfile/02-minimage`

scratch镜像是系统提供的空镜像，仅提供一个Linux的内核环境（基于宿主机/虚拟机/沙箱）。
在Linux环境下，运行环境就是自己的操作系统内核。在Windows环境下就是Linux沙箱或者虚拟器内核。

编译
```bash
# 要使用静态链接方式否则报错，必须编译成与Docker的Linux内核一致的版本
gcc -g -static -static-libgcc -o hello-c-static hello.c
```
运行

```bash
cd ch01-image/02-Dockerfile/02-minimage
docker build -t minimage:v1 .
docker run --rm minimage:v1
docker stop $(docker ps -a -q)
```


#### 03：多阶段构建
Docker 17.05 之后支持


```bash
cd ch01-image/02-Dockerfile/03-multi-stage-build
docker build -t go/helloworld:1 .
```


## 章节2：容器

### 01：容器命令
`ch02-container/01-container.sh`


## 章节3：网络

### 01：网络命令
`ch03-network/01-network.sh`


## 章节4：compose

### 01：简单样例
`ch04-compose/01-example`

一个简单的web项目，包含两个项目
* python web服务器
* redis服务

```bash
cd ch04-compose/01-example
docker-compose up
```


### 02：compose命令
`ch04-compose/02-compose.sh`

### 03：docker-compose.yml语法
`ch04-compose/03-docker-compose.yml`


