FROM alpine as builder

RUN apk add git go

RUN git clone https://github.com/XTLS/Xray-core.git
WORKDIR Xray-core

RUN go build -o ./xray ./main

FROM alpine
LABEL maintainer="zyqcn@live.com"

COPY --from=builder /Xray-core/xray /usr/local/bin/

ENTRYPOINT ["xray"]