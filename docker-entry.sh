#!/bin/sh

sudo chown node:node /app
npm install
npm run dev:ssr
