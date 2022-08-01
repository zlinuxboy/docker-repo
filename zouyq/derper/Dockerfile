FROM golang:alpine as build-stage                                                                                                                                                      

RUN apk add git
RUN git clone https://github.com/tailscale/tailscale.git --depth=1

WORKDIR tailscale/cmd/derper
RUN  go install ./

FROM alpine
LABEL author=zyqcn@live.com

RUN apk add --no-cache tzdata

COPY --from=build-stage /go/bin/derper /usr/local/bin
ENTRYPOINT ["derper"]