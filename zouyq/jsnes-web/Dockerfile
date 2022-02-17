FROM node:12 as build-stage
LABEL author="zouyiq@gmail.com"
WORKDIR /home
ENV NODE_OPTIONS=--openssl-legacy-provider
RUN git clone https://github.com/bfirsh/jsnes-web.git
WORKDIR /home/jsnes-web
RUN yarn install && yarn build

FROM nginx:alpine
LABEL author="zouyiq@gmail.com"
COPY --from=build-stage /home/jsnes-web/build /usr/share/nginx/html