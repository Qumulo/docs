#!/bin/bash
set -euo pipefail

# Get secret from GitHub
echo -n "$ENGINEERING_JSON" | base64 --decode > tools/hot-topic/engineering-173019-49cb92815171.json

# Rebuild the google-analytics-script container
docker build --file tools/hot-topic/Dockerfile --tag google-analytics-script ./tools/hot-topic

# Run the google-analytics-script image to regenerate part of README.md on the mainline branch
docker run --volume $(pwd)/tools/hot-topic/engineering-173019-49cb92815171.json:/app/engineering-173019-49cb92815171.json --volume $(pwd)/README.md:/app/README.md google-analytics-script
