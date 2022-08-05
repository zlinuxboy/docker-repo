FROM golang:alpine as builder

RUN apk add --no-cache git build-base

RUN git clone https://github.com/HyNetwork/hysteria.git

WORKDIR hysteria

RUN set -ex \
    && export VERSION=$(git describe --tags) \
    && export COMMIT=$(git rev-parse HEAD) \
    && export TIMESTAMP=$(date "+%F %T") \
    && go build -trimpath -o /go/bin/hysteria -ldflags \
            "-w -s -X 'main.appVersion=${VERSION}' \
            -X 'main.appCommit=${COMMIT}' \
            -X 'main.appDate=${TIMESTAMP}'" \
            -a ./cmd

FROM alpine

RUN apk add --no-cache tzdata ca-certificates

COPY --from=builder /go/bin/hysteria /usr/local/bin/

ENTRYPOINT ["hysteria"]


