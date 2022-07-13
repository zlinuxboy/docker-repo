FROM alpine AS builder

RUN apk add --no-cache git wget

ADD https://github.com/Dreamacro/maxmind-geoip/releases/latest/download/Country.mmdb  /clash/Country.mmdb
ADD https://github.com/haishanh/yacd/releases/latest/download/yacd.tar.xz /clash/yacd.tar.xz
RUN tar -xvf /clash/yacd.tar.xz -C /clash && rm -rf /clash/yacd.tar.xz


FROM alpine
LABEL container.maintainer="zyqcn@live.com"

COPY --from=dreamacro/clash-premium:latest /clash /usr/bin/clash
COPY --from=builder /clash /clash

RUN apk add --no-cache ca-certificates tzdata tini \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["tini", "--"]
CMD ["clash", "-ext-ui", "/clash/public", "-d", "/clash"]
