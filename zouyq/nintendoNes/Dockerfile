FROM alpine as build-stage
LABEL maintainer="zyqcn@live.com"
WORKDIR /home

RUN apk add --no-cache git
RUN git clone https://github.com/zyqfork/NintendoNes.git

FROM alpine
LABEL maintainer="zyqcn@live.com"

RUN apk add --no-cache tini busybox-extras
COPY --from=build-stage /home/NintendoNes /var/www/html

ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD [ "httpd", "-f", "-v", "-h", "/var/www/html", "-p", "80"]