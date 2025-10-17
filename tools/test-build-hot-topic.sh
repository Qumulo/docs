#!/bin/bash
set -euo pipefail

# If running on GitHub Actions, get secret from GitHub
[ -n "${ENGINEERING_JSON:-}" ]] && echo -n "$ENGINEERING_JSON" | base64 --decode > tools/hot-topic/engineering-173019-f79d4f9c2e03.json

# Rebuild the google-analytics-script container
docker build --file tools/hot-topic/Dockerfile --tag google-analytics-script ./tools/hot-topic

# Run the google-analytics-script image to regenerate part of README.md on the mainline branch
docker run --volume $(pwd)/tools/hot-topic/engineering-173019-f79d4f9c2e03.json:/app/engineering-173019-f79d4f9c2e03.json --volume $(pwd)/README.md:/app/README.md google-analytics-script
