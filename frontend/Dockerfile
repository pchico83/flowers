# syntax = docker/dockerfile:experimental

FROM node:12.18.3-alpine3.9 as dev

WORKDIR /usr/src/app

RUN apk add --no-cache --virtual .gyp \
        bash \
        python \
        make \
        g++


FROM dev as builder

COPY package.json yarn.lock ./
RUN npm install
COPY . .

RUN npm run build

FROM nginx:alpine 
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
EXPOSE 80