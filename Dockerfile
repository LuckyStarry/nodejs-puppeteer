# luckystarry/nodejs-puppeteer:20
# Node.js base image with system-level Chromium (Alpine + apk)

FROM node:20-alpine3.19

WORKDIR /app

# Use Aliyun mirror for faster builds in China
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# Install system-level Chromium and fonts
RUN apk update && apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    ttf-dejavu \
    fontconfig \
    && rm -rf /var/cache/apk/*

# Add Chinese font (SimSun)
COPY simsun.ttc /usr/share/fonts/simsun.ttc
RUN fc-cache -fv && fc-list :lang=zh

# Configure Puppeteer to use system Chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Verify installation
RUN chromium-browser --version

CMD ["node", "--version"]
