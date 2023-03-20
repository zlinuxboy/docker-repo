FROM alpine:edge as build-stage

RUN apk add --no-cache git go

RUN git clone https://github.com/tailscale/tailscale.git --depth=1
WORKDIR tailscale

RUN  ln -f -s $(which go) ./tool/go

RUN ./build_dist.sh tailscale.com/cmd/tailscale
RUN ./build_dist.sh tailscale.com/cmd/tailscaled
RUN ./build_dist.sh tailscale.com/cmd/containerboot

FROM alpine
LABEL author="zyqcn@live.com"

RUN apk add --no-cache ca-certificates iptables iproute2 ip6tables tzdata

COPY --from=build-stage /tailscale/tailscale /usr/local/bin
COPY --from=build-stage /tailscale/tailscaled /usr/local/bin
COPY --from=build-stage /tailscale/containerboot /usr/local/bin

ENTRYPOINT ["containerboot"]