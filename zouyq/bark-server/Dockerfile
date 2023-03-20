FROM alpine:edge as builder

RUN apk add --no-cache bash git go gcc musl-dev curl
RUN git clone https://github.com/Finb/bark-server.git
WORKDIR bark-server

RUN go build -o ./bark-server

FROM alpine
LABEL MAINTAINER="zyqcn@live.com"

COPY --from=builder /bark-server/bark-server /usr/local/bin

ENTRYPOINT ["bark-server"]