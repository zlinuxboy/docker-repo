FROM alpine:latest AS builder

WORKDIR /out

RUN apk add --update --no-cache curl gzip jq  \
    && curl -s https://api.github.com/repos/vernesong/OpenClash/releases | jq -r '.[0] | .assets[0] | .browser_download_url' | xargs curl -sSL  -o clash.ipk

FROM openwrtorg/rootfs
LABEL author=zyqcn@live.com

RUN mkdir -p /var/lock && \
    opkg update

COPY --from=builder /out/clash.ipk /clash.ipk

RUN opkg remove dnsmasq dropbear \
    && opkg install coreutils-nohup bash iptables dnsmasq-full curl ca-certificates ipset ip-full iptables-mod-tproxy iptables-mod-extra libcap libcap-bin ruby ruby-yaml kmod-tun kmod-inet-diag unzip luci-compat luci luci-base \
    && opkg install coreutils-nohup bash dnsmasq-full curl ca-certificates ipset ip-full libcap libcap-bin ruby ruby-yaml kmod-tun kmod-inet-diag unzip kmod-nft-tproxy luci-compat luci luci-base \
    && opkg install luci luci-base luci-compat luci-i18n-base-zh-cn \
    && opkg install /clash.ipk

RUN rm -rf /clash.ipk

CMD ["/sbin/init"]