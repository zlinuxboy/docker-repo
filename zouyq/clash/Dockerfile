FROM alpine:latest AS builder
RUN apk add --no-cache git wget
ADD https://github.com/Dreamacro/maxmind-geoip/releases/latest/download/Country.mmdb  /clash/Country.mmdb
RUN wget -O yacd.zip 'https://github.com/haishanh/yacd/archive/gh-pages.zip' \
    && mkdir /clash/ui \
    && unzip yacd.zip -d /clash/ui \
    && mv /clash/ui/yacd-gh-pages/* /clash/ui


FROM alpine:latest
LABEL container.maintainer="zyqcn@live.com"

ENV TZ=Asia/Shanghai

COPY --from=dreamacro/clash-premium:latest /clash /usr/bin/clash
COPY --from=builder /clash /clash

RUN apk add --no-cache ca-certificates tzdata tini \
    && rm -rf /var/cache/apk/*

WORKDIR /clash

ENTRYPOINT ["tini", "--"]
CMD ["clash", "-ext-ui", "/clash/ui", "-d", "/clash"]
