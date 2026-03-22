# luckystarry/nodejs-puppeteer

[![Docker Pulls](https://img.shields.io/docker/pulls/luckystarry/nodejs-puppeteer.svg)](https://hub.docker.com/r/luckystarry/nodejs-puppeteer)
[![Docker Image Size](https://img.shields.io/docker/image-size/luckystarry/nodejs-puppeteer/20)](https://hub.docker.com/r/luckystarry/nodejs-puppeteer)

Pre-installed Node.js base image with system-level Chromium for Puppeteer (Alpine-based).

## Features

- Node.js 20.x (Alpine)
- System-level Chromium (via apk)
- Chinese font support (SimSun)
- No Puppeteer Chromium download required
- Image size: ~220MB (vs ~450MB with official approach)
- Build time: ~3 minutes (vs 5-10 minutes)

## Quick Start

### Use as Base Image

```dockerfile
FROM luckystarry/nodejs-puppeteer:20

WORKDIR /app

COPY package.json ./
RUN npm install --omit=dev

COPY . .
RUN npm run build

CMD ["node", "dist/index.js"]
```

### Environment Variables

```dockerfile
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
```

## Build

```bash
./build.sh
# or
docker build -t luckystarry/nodejs-puppeteer:20 .
docker push luckystarry/nodejs-puppeteer:20
```

## Image Size

- node:20-alpine3.19: ~50MB
- Chromium + fonts: ~150MB
- Chinese font (SimSun): ~17MB
- **Total: ~220MB**

## Comparison

| Approach | Base | Chromium | Chinese Font | Size | Build Time |
|----------|------|----------|--------------|------|------------|
| This image | Alpine | apk | ✅ SimSun | ~220MB | ~3 min |
| Official | Debian | download | ❌ | ~450MB | 5-10 min |

## Notes

1. Alpine uses musl libc - some npm packages may need recompilation
2. Chinese font (SimSun) is included for Mermaid Chinese text rendering
3. Lock puppeteer version for system Chromium compatibility

## License

MIT
