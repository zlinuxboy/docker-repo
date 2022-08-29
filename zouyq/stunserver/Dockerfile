FROM alpine as builder

RUN apk add --no-cache git build-base boost-dev openssl-dev icu-data-full

RUN git clone https://github.com/jselbie/stunserver.git
WORKDIR stunserver
RUN make

FROM alpine
LABEL author=zyqcn@live.com
RUN apk add --no-cache libstdc++

COPY --from=builder /stunserver/stunserver /usr/local/bin/
ENTRYPOINT ["stunserver"]