FROM node:18.20.8-bookworm-slim
# 使用 apt 升级 shadow 包到安全版本
RUN apt-get update && \
    apt-get install --only-upgrade -y passwd login && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY graphserver.js .
COPY package.json .
COPY UScities.json .
RUN npm install &&\
    apk update &&\
    apk upgrade
EXPOSE  4000
CMD node graphserver.js
