FROM alpine:edge as builder

RUN apk add --no-cache make git go && \
    mkdir /clash-config && \
    wget -O /clash-config/Country.mmdb https://raw.githubusercontent.com/Loyalsoldier/geoip/release/Country.mmdb && \
    wget -O /clash-config/geosite.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat && \
    wget -O /clash-config/geoip.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat

RUN git clone https://github.com/MetaCubeX/Clash.Meta.git

WORKDIR Clash.Meta
RUN go build -o /clash ./

FROM alpine:latest
LABEL org.opencontainers.image.source="https://github.com/MetaCubeX/Clash.Meta"

RUN apk add --no-cache ca-certificates tzdata iptables


COPY --from=builder /clash-config/ /root/.config/clash/
COPY --from=builder /clash /clash

ENTRYPOINT [ "/clash" ]