FROM golang:alpine as builder

RUN apk add --update git build-base libmnl-dev iptables

RUN git clone https://github.com/gravitl/netmaker.git

WORKDIR netmaker

RUN export GO111MODULE=auto  \
    && GOOS=linux GOARCH=amd64 CGO_ENABLED=0 /usr/local/go/bin/go build -ldflags="-w -s" -o netclient-app netclient/main.go

WORKDIR /go

RUN git clone https://git.zx2c4.com/wireguard-go && \
    cd wireguard-go && \
    make && \
    make install

ENV WITH_WGQUICK=yes
RUN git clone https://git.zx2c4.com/wireguard-tools && \
    cd wireguard-tools && \
    cd src && \
    make && \
    make install

FROM alpine


RUN apk add --no-cache --update bash libmnl gcompat iptables openresolv iproute2

COPY --from=builder /usr/bin/wireguard-go /usr/bin/wg* /usr/bin/
COPY --from=builder /app/netclient-app ./netclient
COPY --from=builder /app/scripts/netclient.sh .

RUN chmod 0755 netclient && chmod 0755 netclient.sh

ENV WG_QUICK_USERSPACE_IMPLEMENTATION=wireguard-go

ENTRYPOINT ["/bin/bash", "./netclient.sh"]