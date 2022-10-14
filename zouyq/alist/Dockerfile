FROM alpine:edge as builder

RUN apk add --no-cache bash git go gcc musl-dev curl
RUN git clone https://github.com/alist-org/alist.git
WORKDIR alist

RUN bash build.sh release docker

FROM alpine
LABEL MAINTAINER="zyqcn@live.com"

COPY --from=builder /alist/bin/alist /usr/local/bin

ENTRYPOINT ["alist"]
CMD ["server", "--no-prefix" ]
