FROM golang:alpine AS builder

RUN apk update && apk add --no-cache git bash wget curl
WORKDIR /build

RUN git clone --depth=1 --progress https://github.com/v2fly/v2ray-core.git . && \
    bash ./release/user-package.sh nosource noconf codename=$(git describe --abbrev=0 --tags) buildname=docker-fly abpathtgz=/tmp/v2ray.tgz

FROM alpine

COPY --from=builder /tmp/v2ray.tgz /tmp

RUN apk add --no-cache tzdata ca-certificates && \
    tar xvfz /tmp/v2ray.tgz -C /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/v2ray", "run", "-config"]
CMD ["/etc/v2ray/config.json"]