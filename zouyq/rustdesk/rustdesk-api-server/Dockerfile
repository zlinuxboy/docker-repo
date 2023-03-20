FROM alpine as builder

RUN apk add git go build-base
RUN git clone https://github.com/xiaoyi510/rustdesk-api-server.git

WORKDIR rustdesk-api-server

RUN sed -i 's/39999999/999999/g' ./utils/utils.go

RUN CGO_ENABLED=1 go build -o rustdesk-api-server .

FROM alpine
LABEL MAINTAINER="zyqcn@live.com"

COPY --from=builder /rustdesk-api-server/rustdesk-api-server /app/rustdesk-api-server
COPY --from=builder /rustdesk-api-server/conf/app.conf /app/conf/app.conf

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /app/conf/app.conf
WORKDIR /app

ENTRYPOINT ["/app/rustdesk-api-server"]

