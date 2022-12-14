FROM alpine:edge as builder

RUN apk add --no-cache git go build-base

RUN git clone https://github.com/goreleaser/goreleaser.git
WORKDIR goreleaser

RUN go build -o /goreleaser ./

FROM alpine
LABEL MAINTAINER="zyqcn@live.com"

COPY --from=builder /goreleaser/goreleaser /usr/local/bin

ENTRYPOINT ["goreleaser"]