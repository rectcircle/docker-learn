# 第一阶段：编译
FROM golang:1.9-alpine 

# 安装 git
RUN apk --no-cache add git 

WORKDIR /go/src/github.com/go/helloworld/ 

RUN go get -d -v github.com/go-sql-driver/mysql 

COPY app.go . 

#编译
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app . 


# 第二阶段：运行
# 一个轻量级Linux且支持apk包管理器
FROM alpine:latest  

# 安装
RUN apk --no-cache add ca-certificates

WORKDIR /root/ 

# 从上一阶段中拷贝
COPY --from=0 /go/src/github.com/go/helloworld/app . 
CMD ["./app"]