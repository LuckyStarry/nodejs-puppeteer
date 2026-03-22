# luckystarry/nodejs-puppeteer:20
# Based on official Puppeteer image with Chinese font support

FROM ghcr.io/puppeteer/puppeteer:24.4.0

USER root

# Add Chinese font (SimSun) for Mermaid Chinese text rendering
COPY simsun.ttc /usr/share/fonts/simsun.ttc
RUN fc-cache -fv && fc-list :lang=zh

USER pptruser
