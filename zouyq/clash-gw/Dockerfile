FROM openwrtorg/rootfs
LABEL author=zouyiq@gmail.com

RUN mkdir -p /var/lock && \
    opkg update && \
    opkg install luci luci-base luci-compat luci-i18n-base-zh-cn \
                 coreutils-nohup bash iptables curl \
                 jsonfilter ca-certificates ipset ip-full  \
                 iptables-mod-tproxy iptables-mod-extra libcap libcap-bin ruby ruby-yaml

RUN opkg remove dnsmasq dropbear && opkg install dnsmasq-full

ADD config/network /etc/config/network
ADD scripts /scripts

WORKDIR /scripts
RUN chmod +x *.sh && sh *.sh
RUN rm -rf /var/opkg-lists && rm -rf /scripts
WORKDIR /home

CMD ["/sbin/init"]

