FROM alpine:edge AS builder

RUN apk add --no-cache git make go
RUN git clone https://github.com/p4gefau1t/trojan-go.git --depth=1
WORKDIR trojan-go
RUN  make

FROM alpine

RUN apk add --no-cache tzdata ca-certificates

COPY --from=builder /trojan-go/build/trojan-go /usr/local/bin/

ENTRYPOINT ["trojan-go"]
