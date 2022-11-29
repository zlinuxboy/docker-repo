FROM alpine:edge as build-stage

RUN apk add --update go git build-base

RUN git clone https://github.com/juanfont/headscale.git

WORKDIR headscale
RUN CGO_ENABLED=0 go build -o ./headscale -a ./cmd/headscale

FROM alpine
LABEL author="zyqcn@live.com"

RUN apk add --no-cache tzdata

COPY --from=build-stage /headscale/headscale /usr/local/bin

ENTRYPOINT ["headscale"]