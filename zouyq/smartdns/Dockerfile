FROM alpine as builder

RUN apk add git build-base linux-headers openssl-dev

RUN git clone https://github.com/pymumu/smartdns.git
WORKDIR smartdns

RUN make -j${nproc}

FROM alpine
LABEL author=zyqcn@live.com

RUN apk add --no-cache openssl libgcc

COPY --from=builder /smartdns/src/smartdns /usr/local/bin/
COPY --from=builder /smartdns/etc/smartdns/smartdns.conf /etc/smartdns/smartdns.conf

ENTRYPOINT ["smartdns"]
CMD ["-f","-x", "-c", "/etc/smartdns/smartdns.conf"]
