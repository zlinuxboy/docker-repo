
FROM node:12 as build-stage
LABEL author="zouyiq@gmail.com"
WORKDIR /home

RUN git clone https://github.com/zyqfork/jsnes.git

FROM nginx:alpine
LABEL author="zouyiq@gmail.com"

RUN apk add --no-cache busybox-extras

COPY --from=build-stage /home/jsnes/build /usr/share/nginx/html