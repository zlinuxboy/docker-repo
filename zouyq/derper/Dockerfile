FROM golang:alpine as build-stage
LABEL author="zouyiq@gmail.com"

FROM golang:latest AS builder
WORKDIR /app

# https://tailscale.com/kb/1118/custom-derp-servers/
RUN CGO_ENABLED=0 go install tailscale.com/cmd/derper@main

FROM alpine
#RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
WORKDIR /app

RUN mkdir /app/cert

ENV DERP_DOMAIN your-hostname.com
ENV DERP_CERT_DIR /app/certs
ENV DERP_ADDR :443
ENV DERP_STUN true

COPY --from=builder /go/bin/derper .

CMD /app/derper --hostname $DERP_DOMAIN --certdir $DERP_CERT_DIR --a $DERP_ADDR --stun $DERP_STUN
