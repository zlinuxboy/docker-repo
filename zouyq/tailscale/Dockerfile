FROM alpine:edge as build-stage

RUN apk add --no-cache git go

RUN git clone https://github.com/tailscale/tailscale.git

WORKDIR tailscale

RUN go build -o ./tailscale ./cmd/tailscale
RUN go build -o ./tailscaled ./cmd/tailscaled


FROM alpine
LABEL author="zyqcn@live.com"

RUN apk add --no-cache ca-certificates iptables iproute2 ip6tables tzdata

COPY --from=build-stage /tailscale/tailscale /usr/local/bin
COPY --from=build-stage /tailscale/tailscaled /usr/local/bin

ENTRYPOINT ["tailscaled"]