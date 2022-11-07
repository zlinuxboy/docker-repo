FROM alpine:edge as wireguard-go

RUN apk add --no-cache bash git go gcc musl-dev make
RUN git clone https://github.com/WireGuard/wireguard-go.git

WORKDIR wireguard-go
RUN make

FROM alpine:edge as wireguard-tools
RUN apk add --no-cache git libmnl-dev libelf make  musl-dev gcc

RUN git clone https://github.com/WireGuard/wireguard.git
WORKDIR wireguard/src/tools

RUN make

FROM alpine:edge
LABEL MAINTAINER="zyqcn@live.com"

COPY --from=wireguard-go /wireguard-go/wireguard-go /usr/local/bin
COPY --from=wireguard-tools /wireguard/src/tools/wg /usr/local/bin
COPY --from=wireguard-tools /wireguard/src/tools/wg-quick /usr/local/bin/wg-quick
