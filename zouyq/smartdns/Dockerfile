FROM alpine:latest as builder

RUN apk update && apk add --no-cache --virtual .build-deps git curl gcc g++ linux-headers make openssl-dev

WORKDIR /usr/src

RUN git clone https://github.com/pymumu/smartdns.git \
    && cd ./smartdns \
    && make -j

FROM alpine:latest
LABEL author=zyqcn@live.com

RUN apk add --no-cache openssl libgcc

COPY --from=builder /usr/src/smartdns/etc/smartdns/smartdns.conf /etc/smartdns/smartdns.conf
COPY --from=builder /usr/src/smartdns/src/smartdns /usr/local/bin/

ENTRYPOINT ["smartdns", "-f","-x", "-c", "/etc/smartdns/smartdns.conf"]
