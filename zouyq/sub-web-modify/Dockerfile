FROM node:alpine as build-stage
LABEL author="zouyiq@gmail.com"

RUN apk add --no-cache git
WORKDIR /home
RUN git clone https://github.com/limr95/sub-web-modify.git
WORKDIR /home/sub-web-modify
RUN yarn install && yarn build

FROM nginx:alpine
LABEL author="zouyiq@gmail.com"
COPY --from=build-stage /home/sub-web-modify/dist /usr/share/nginx/html