# 指定基础镜像，本机或者网络上的镜像
FROM nginx

# 创建镜像时执行的命令
# RUN <命令> 
# RUN ["可执行文件", "参数1", "参数2"]
# 一个RUN对应一层镜像，所以最好只写一个RUN 多条命令使用&&连接

RUN echo '<h1>Hello, Docker!</h1>' > /usr/share/nginx/html/index.html
