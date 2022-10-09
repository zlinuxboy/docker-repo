FROM alpine as builder

RUN apk add --no-cache npm jq git

RUN git clone https://github.com/gurucomputing/headscale-ui --depth=1
WORKDIR headscale-ui
RUN sed -i 's/\/web//g' svelte.config.js

RUN npm install && npm run build

FROM nginx:alpine
LABEL MAINTAINER="zyqcn@live.com"

COPY --from=builder /headscale-ui/build /usr/share/nginx/html


