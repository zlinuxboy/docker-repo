FROM node:alpine as build-stage
LABEL author="zouyiq@gmail.com"

RUN apk add --no-cache git
WORKDIR /home

ENV NODE_OPTIONS=--openssl-legacy-provider

RUN git clone https://github.com/CareyWang/sub-web.git
WORKDIR /home/sub-web
RUN yarn install && yarn build

FROM nginx:alpine
LABEL author="zouyiq@gmail.com"

COPY --from=build-stage /home/sub-web/dist /usr/share/nginx/html