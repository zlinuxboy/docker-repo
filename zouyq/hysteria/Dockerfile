FROM alpine as builder

RUN apk add git go build-base

RUN git clone https://github.com/apernet/hysteria

WORKDIR hysteria

RUN go build -o ./hysteria -a ./app/cmd

FROM alpine

RUN apk add --no-cache tzdata ca-certificates

COPY --from=builder /hysteria/hysteria /usr/local/bin/

ENTRYPOINT ["hysteria"]


