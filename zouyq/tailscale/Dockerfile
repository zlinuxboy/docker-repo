FROM golang:alpine as build-stage

RUN apk update && apk add git curl

WORKDIR /
RUN git clone https://github.com/tailscale/tailscale.git

WORKDIR /tailscale
RUN ./build_dist.sh tailscale.com/cmd/tailscale
RUN ./build_dist.sh tailscale.com/cmd/tailscaled

FROM alpine
LABEL author="zyqcn@live.com"

RUN apk add --no-cache ca-certificates iptables iproute2 ip6tables

COPY --from=build-stage /tailscale/tailscale /usr/local/bin
COPY --from=build-stage /tailscale/tailscaled /usr/local/bin
