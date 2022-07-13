FROM alpine
LABEL author=zyqcn@live.com

RUN apk add --no-cache curl ca-certificates docker-cli

ENV FLYCTL_INSTALL="/usr/local"

RUN curl -L https://fly.io/install.sh | sh