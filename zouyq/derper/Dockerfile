FROM alpine:edge as build-stage

RUN apk add --no-cache git go

RUN git clone https://github.com/tailscale/tailscale.git

WORKDIR tailscale

RUN go build -o ./derper ./cmd/derper

FROM alpine
LABEL author=zyqcn@live.com

RUN apk add --no-cache tzdata

COPY --from=build-stage /tailscale/derper /usr/local/bin

ENTRYPOINT ["derper"]