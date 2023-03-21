FROM alpine:edge as wireguard-go

RUN apk add git go
RUN git clone https://github.com/WireGuard/wireguard-go.git

WORKDIR wireguard-go

RUN go build -o wireguard-go

FROM alpine as wireguard-tools
RUN apk add git build-base libmnl-dev libelf
RUN git clone https://github.com/WireGuard/wireguard.git
WORKDIR wireguard/src/tools

RUN make -j${nproc}

FROM alpine
LABEL MAINTAINER="zyqcn@live.com"

RUN apk add libmnl-dev libelf bash

COPY --from=wireguard-go /wireguard-go/wireguard-go /usr/local/bin
COPY --from=wireguard-tools /wireguard/src/tools/wg /usr/local/bin
COPY --from=wireguard-tools /wireguard/src/tools/wg-quick/linux.bash /usr/local/bin/wg-quick
