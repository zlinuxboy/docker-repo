FROM alpine:edge as builder

RUN apk add --no-cache bash git go gcc musl-dev curl
RUN git clone https://github.com/danbai225/go-rustdesk-server.git
WORKDIR go-rustdesk-server

RUN CGO_ENABLED=0 go build  -a ./

FROM alpine
LABEL MAINTAINER="zyqcn@live.com"

COPY --from=builder /go-rustdesk-server/go-rustdesk-server /usr/local/bin

ENTRYPOINT ["go-rustdesk-server"]

