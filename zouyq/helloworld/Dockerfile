FROM alpine
LABEL author=zyqcn@live.com

RUN apk add --no-cache busybox-extras tini

COPY index.html /home/index.html

ENTRYPOINT ["tini", "--"]
CMD [ "httpd", "-p", "80", "-h", "/home" ,"-f"]