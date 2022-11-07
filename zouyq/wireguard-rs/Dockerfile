FROM alpine as builder

RUN apk add --no-cache git alpine-sdk cargo
RUN git clone https://github.com/WireGuard/wireguard-rs.git

WORKDIR wireguard-rs

RUN cargo build --release
