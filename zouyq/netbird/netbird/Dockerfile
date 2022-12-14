FROM alpine as builder

RUN apk add --no-cache git go build-base
RUN git clone https://github.com/netbirdio/netbird.git

WORKDIR netbird

RUN go build -o ./netbird ./client

FROM alpine
LABEL MAINTAINER="zyqcn@live.com"

COPY --from=builder /netbird/netbird /usr/local/bin

ENTRYPOINT ["netbird"]
CMD ["service","run"]