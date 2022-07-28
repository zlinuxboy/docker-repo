FROM alpine:latest as builder

RUN apk add --no-cache git make build-base
RUN git clone https://github.com/Wind4/vlmcsd.git --depth=1

WORKDIR vlmcsd

RUN make

FROM alpine
LABEL maintainer="zyqcn@live.com"

COPY --from=builder /vlmcsd/bin/vlmcsd /usr/bin/vlmcsd

ENTRYPOINT ["vlmcsd"]

