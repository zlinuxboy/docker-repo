FROM alpine:edge as build-stage

RUN apk add --no-cache git go

RUN git clone https://github.com/tailscale/tailscale.git
WORKDIR tailscale

RUN  ln -f -s $(which go) ./tool/go

RUN ./build_dist.sh tailscale.com/cmd/derper

FROM alpine
LABEL author="zyqcn@live.com"

COPY --from=build-stage /tailscale/derper /usr/local/bin

ENTRYPOINT ["derper"]