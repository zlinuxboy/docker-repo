FROM golang:alpine as build-stage
LABEL author="zouyiq@gmail.com"

FROM golang:latest AS builder
WORKDIR /app

# https://tailscale.com/kb/1118/custom-derp-servers/
RUN CGO_ENABLED=0 go install tailscale.com/cmd/derper@main

FROM alpine
#RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

COPY --from=builder /go/bin/derper /

CMD /derper
