# docker build -t tetris:latest .
# docker run -d --name tetris -p 8090:80 tetris:latest
# 浏览器访问http://ip:8090
FROM node:lts-alpine AS build0

COPY . /tetris/

WORKDIR /tetris

RUN npm cache clean -f && \
    npm install  && \
    npm run build


FROM nginx:alpine

COPY --from=build0 /tetris/docs /usr/share/nginx/html
