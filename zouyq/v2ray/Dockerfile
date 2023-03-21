FROM alpine AS builder

RUN apk add git go
RUN git clone https://github.com/v2fly/v2ray-core.git

WORKDIR /v2ray-core

RUN go build -o ./v2ray ./main

FROM alpine

COPY --from=builder /v2ray-core/v2ray /usr/local/bin/v2ray

ENTRYPOINT ["v2ray"]
