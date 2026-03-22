# luckystarry/nodejs-puppeteer

[![Docker Pulls](https://img.shields.io/docker/pulls/luckystarry/nodejs-puppeteer.svg)](https://hub.docker.com/r/luckystarry/nodejs-puppeteer)
[![Docker Image Size](https://img.shields.io/docker/image-size/luckystarry/nodejs-puppeteer/24.4.0)](https://hub.docker.com/r/luckystarry/nodejs-puppeteer)

Node.js base image with Puppeteer + Chromium + Chinese font support.

**Version**: 24.4.0 (aligned with official Puppeteer)

## Features

- Based on official `ghcr.io/puppeteer/puppeteer:24.4.0`
- Node.js 20.x
- Chromium (official, fully compatible)
- Chinese font (SimSun) for Mermaid rendering
- Image size: ~350MB

## Quick Start

### Use as Base Image

```dockerfile
FROM luckystarry/nodejs-puppeteer:24.4.0

WORKDIR /app

COPY package.json ./
RUN npm install --omit=dev

COPY . .
RUN npm run build

CMD ["node", "dist/index.js"]
```

### Install mermaid-cli in Your App

```json
{
  "dependencies": {
    "@mermaid-js/mermaid-cli": "^11.0.0"
  }
}
```

### Environment Variables (inherited from official image)

- `PUPPETEER_EXECUTABLE_PATH` - Chromium path (auto-configured)
- `PUPPETEER_SKIP_CHROMIUM_DOWNLOAD` - Skip download (auto-configured)

## Build

```bash
./build.sh
# or
docker build -t luckystarry/nodejs-puppeteer:24.4.0 .
docker push luckystarry/nodejs-puppeteer:24.4.0
```

## Image Size

- Official Puppeteer image: ~330MB
- Chinese font (SimSun): ~17MB
- **Total: ~350MB**

## Versioning

Version follows official Puppeteer releases:

| Image Version | Puppeteer | Node.js |
|---------------|-----------|---------|
| 24.4.0 | 24.4.0 | 20.x |

## Notes

1. Based on official Puppeteer image - Chromium version is fully compatible
2. Chinese font (SimSun) included for Mermaid Chinese text rendering
3. All environment variables inherited from official image

## License

MIT
