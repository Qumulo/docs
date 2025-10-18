#!/bin/bash
set -euo pipefail

# Decode secret from GitHub Actions into a temp file
echo -n "$ENGINEERING_JSON" | base64 --decode > /tmp/hot-topic-key.json

# Build + run
docker build --file tools/hot-topic/Dockerfile --tag google-analytics-script ./tools/hot-topic
docker run --rm \
  -v /tmp/hot-topic-key.json:/app/hot-topic-key.json \
  -v "$(pwd)/README.md:/app/README.md" \
  google-analytics-script

# Clean up
rm -f /tmp/hot-topic-key.json
