FROM alpine as build-stage

RUN apk add --no-cache git curl

RUN git clone https://github.com/tailscale/tailscale.git --depth=1

FROM alpine
LABEL author="zyqcn@live.com"

RUN apk add --no-cache ca-certificates iptables iproute2 ip6tables tzdata

COPY --from=zouyq/tailscale /usr/local/bin/tailscale /usr/local/bin
COPY --from=zouyq/tailscale /usr/local/bin/tailscaled /usr/local/bin
COPY --from=build-stage /tailscale/docs/k8s/run.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]