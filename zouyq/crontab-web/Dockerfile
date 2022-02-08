FROM golang:alpine as build-stage
LABEL author="zouyiq@gmail.com"

RUN apk update && apk add git

WORKDIR /
RUN git clone https://github.com/tailscale/tailscale.git

WORKDIR /tailscale/cmd/derper
RUN go install ./

# https://tailscale.com/kb/1118/custom-derp-servers/
FROM alpine
COPY --from=build-stage /go/bin/derper /
CMD /derper
