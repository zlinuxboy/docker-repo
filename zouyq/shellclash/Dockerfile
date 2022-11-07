FROM alpine as builder

RUN apk add --no-cache curl
RUN export url='https://raw.githubusercontent.com/juewuy/ShellClash/master'  \
    && sh -c "$(curl -kfsSl $url/install.sh)"  \
    && source /etc/profile &> /dev/null


FROM alpine
LABEL MAINTAINER="zyqcn@live.com"

RUN apk add --no-cache tzdata tini

COPY --from=builder /etc/clash /etc/clash

WORKDIR /etc/clash

ENTRYPOINT ["tini", "--"]
CMD ["start.sh"]