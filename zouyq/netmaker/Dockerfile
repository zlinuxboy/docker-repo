FROM golang:alpine as builder

RUN apk add git build-base
RUN git clone https://github.com/gravitl/netmaker.git

WORKDIR netmaker

RUN export VERSION=$(git describe --tags) \
    && export GO111MODULE=auto \
    && GOOS=linux CGO_ENABLED=1 go build -ldflags="-s -X 'main.version=${VERSION}'" -o /usr/local/bin/netmaker main.go

FROM alpine

LABEL author="zyqcn@live.com"

RUN apk add gcompat iptables wireguard-tools

RUN mkdir -p /etc/netclient/config
COPY --from=builder /usr/local/bin/netmaker /usr/local/bin

EXPOSE 8081
ENTRYPOINT ["netmaker"]