FROM golang:alpine as build-stage

RUN apk add --no-cache git gcc musl-dev

RUN git clone https://github.com/juanfont/headscale.git --depth=1
WORKDIR headscale

RUN CGO_ENABLED=0 go build -o /go/bin/headscale -a ./cmd/headscale

FROM alpine
LABEL author="zyqcn@live.com"

RUN apk add --no-cache tzdata

COPY --from=build-stage /go/bin/headscale /usr/local/bin

ENTRYPOINT ["headscale"]