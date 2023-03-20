FROM alpine:edge as builder

RUN apk add --no-cache make git go

RUN git clone https://github.com/MetaCubeX/Clash.Meta.git
WORKDIR Clash.Meta
RUN go build -o clash ./

ADD https://raw.githubusercontent.com/Loyalsoldier/geoip/release/Country.mmdb /clash/Country.mmdb
ADD https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat  /clash/geosite.dat
ADD https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat  /clash/geoip.dat
ADD https://github.com/haishanh/yacd/releases/latest/download/yacd.tar.xz /clash/yacd.tar.xz
RUN tar -xvf /clash/yacd.tar.xz -C /clash

FROM alpine:latest
LABEL org.opencontainers.image.source="https://github.com/MetaCubeX/Clash.Meta"

RUN apk add --no-cache ca-certificates tzdata iptables

COPY --from=builder /Clash.Meta/clash /usr/local/bin/clash
COPY --from=builder /clash/Country.mmdb /clash/Country.mmdb
COPY --from=builder /clash/geosite.dat /clash/geosite.dat
COPY --from=builder /clash/geoip.dat /clash/geoip.dat

COPY --from=builder /clash/public /ui

ENTRYPOINT [ "clash" ]
CMD ["-ext-ui", "/ui", "-d", "/clash"]