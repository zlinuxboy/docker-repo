FROM alpine as builder

RUN apk add --no-cache git npm
RUN git clone https://github.com/netbirdio/dashboard.git

WORKDIR dashboard

RUN npm install && npm run build

FROM alpine
LABEL MAINTAINER="zyqcn@live.com"

RUN apk add --no-cache bash curl less ca-certificates git tzdata zip gettext nginx curl supervisor certbot-nginx

COPY --from=builder /dashboard/docker/default.conf /etc/nginx/http.d/default.conf
COPY --from=builder /dashboard/docker/nginx.conf /etc/nginx/nginx.conf

COPY --from=builder /dashboard/docker/init_react_envs.sh /usr/local/init_react_envs.sh
COPY --from=builder /dashboard/docker/init_cert.sh /usr/local/init_cert.sh
COPY --from=builder /dashboard/docker/supervisord.conf /etc/supervisord.conf
COPY --from=builder /dashboard/build/ /usr/share/nginx/html/

RUN chmod +x /usr/local/init_react_envs.sh

ENTRYPOINT ["supervisord"]
