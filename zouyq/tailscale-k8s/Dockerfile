FROM zouyq/tailscale
LABEL author="zyqcn@live.com"

RUN apk add --no-cache ca-certificates iptables iproute2 ip6tables
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]