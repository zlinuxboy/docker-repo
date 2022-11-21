FROM alpine AS builder

RUN apk add --no-cache git wget

ADD https://github.com/Dreamacro/maxmind-geoip/releases/latest/download/Country.mmdb  /clash/Country.mmdb

ADD https://github.com/haishanh/yacd/releases/latest/download/yacd.tar.xz /clash/yacd.tar.xz
RUN tar -xvf /clash/yacd.tar.xz -C /clash

FROM alpine
LABEL container.maintainer="zyqcn@live.com"

COPY --from=dreamacro/clash-premium:latest /clash /usr/bin/clash
COPY --from=builder /clash /clash

RUN apk add --no-cache tzdata

ENTRYPOINT ["clash"]
CMD ["-ext-ui", "/clash/public", "-d", "/clash"]
