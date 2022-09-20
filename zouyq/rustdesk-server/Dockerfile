FROM alpine as builder

RUN apk add --no-cache git alpine-sdk cargo
RUN git clone https://github.com/rustdesk/rustdesk-server.git

WORKDIR rustdesk-server

RUN cargo build --release

FROM alpine
LABEL MAINTAINER="zyqcn@live.com"

RUN apk add --no-cache tzdata tini libgcc

COPY --from=builder /rustdesk-server/target/release/hbbr /usr/local/bin/hbbr
COPY --from=builder /rustdesk-server/target/release/hbbs /usr/local/bin/hbbs

ENTRYPOINT ["tini", "--"]