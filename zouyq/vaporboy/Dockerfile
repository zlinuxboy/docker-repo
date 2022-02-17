FROM node:alpine as build-stage
LABEL author="zouyiq@gmail.com"

RUN apk add --no-cache git
WORKDIR /home
ENV NODE_OPTIONS=--openssl-legacy-provider
RUN git clone https://github.com/torch2424/vaporBoy.git
WORKDIR /home/vaporBoy
RUN npm install
RUN npm run preact:build

FROM nginx:alpine
LABEL author="zouyiq@gmail.com"
COPY --from=build-stage /home/vaporBoy/www /usr/share/nginx/html