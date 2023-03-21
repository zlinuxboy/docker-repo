FROM alpine
LABEL author=zyqcn@live.com

RUN apk add --no-cache busybox-extras

COPY index.html /home/index.html

ENTRYPOINT ["httpd"]
CMD ["-p", "80", "-h", "/home" ,"-f"]