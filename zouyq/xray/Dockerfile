FROM golang:alpine as builder

RUN apk add --no-cache git

RUN git clone https://github.com/XTLS/Xray-core.git --depth=1

WORKDIR Xray-core

RUN CGO_ENABLED=0 go build -o /tmp/bin/xray -trimpath -ldflags '-s -w -buildid=' ./main

FROM alpine
LABEL maintainer="zyqcn@live.com"

RUN apk add --no-cache tzdata
COPY --from=builder /tmp/bin/xray /usr/local/bin/

ENTRYPOINT ["xray"]