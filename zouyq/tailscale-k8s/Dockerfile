FROM alpine
LABEL author="zyqcn@live.com"

RUN apk add --no-cache ca-certificates iptables iproute2 ip6tables

COPY --from=build-stage /tailscale/tailscale /usr/local/bin
COPY --from=build-stage /tailscale/tailscaled /usr/local/bin
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]