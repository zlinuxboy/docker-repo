FROM golang:alpine as builder

RUN apk add --update git make build-base npm yarn
RUN git clone https://github.com/AdguardTeam/AdGuardHome.git

WORKDIR AdGuardHome

RUN make

FROM alpine
LABEL MAINTAINER="zyqcn@live.com"

COPY --from=builder /go/AdGuardHome/AdGuardHome /usr/local/bin/AdGuardHome

ENTRYPOINT ["AdGuardHome"]
