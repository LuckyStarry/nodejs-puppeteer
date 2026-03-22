#!/bin/bash
set -e

IMAGE_NAME="luckystarry/nodejs-puppeteer"
TAG="24.4.0"

echo "Building ${IMAGE_NAME}:${TAG} ..."
docker build -t ${IMAGE_NAME}:${TAG} .
docker tag ${IMAGE_NAME}:${TAG} ${IMAGE_NAME}:latest

echo "Build completed!"
echo ""
echo "Image size:"
docker images ${IMAGE_NAME}:${TAG}

echo ""
echo "Verify Chromium:"
docker run --rm ${IMAGE_NAME}:${TAG} chromium-browser --version

echo ""
echo "Push to Docker Hub:"
echo "   docker push ${IMAGE_NAME}:${TAG}"
echo "   docker push ${IMAGE_NAME}:latest"
