FROM alpine AS builder

RUN apk add git go
RUN git clone https://github.com/p4gefau1t/trojan-go.git
WORKDIR trojan-go

RUN go build -tags full -o ./trojan-go

FROM alpine

COPY --from=builder /trojan-go/trojan-go /usr/local/bin/

ENTRYPOINT ["trojan-go"]
