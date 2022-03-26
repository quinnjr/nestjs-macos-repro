# syntax=docker/dockerfile:1.3-labs
FROM node:lts-alpine as builder

ENV ENV development
ENV NODE_ENV development
ENV PATH /app/node_modules/.bin:/usr/local/bin:$PATH
ENV CPPFLAGS "-DPNG_ARM_NEON_OPT=0"

WORKDIR /app

COPY . .

RUN apk add python3 build-base sudo && \
  npm i -g @angular/cli @nestjs/cli && \
  chown -R node:node /app && \
  echo 'node   ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

EXPOSE 4200

ENTRYPOINT ["./docker-entry.sh"]
