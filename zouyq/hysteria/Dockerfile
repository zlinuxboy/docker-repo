FROM golang:alpine as builder

RUN apk add --no-cache git

RUN git clone https://github.com/HyNetwork/hysteria.git --depth=1

WORKDIR hysteria

RUN CGO_ENABLED=0 go build -o /tmp/bin/hysteria -trimpath -ldflags '-s -w -buildid=' ./cmd

FROM alpine

RUN apk add --no-cache tzdata ca-certificates

COPY --from=builder /tmp/bin/hysteria /usr/local/bin/

ENTRYPOINT ["hysteria"]


