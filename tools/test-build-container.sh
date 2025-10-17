#!/bin/bash
set -euo pipefail

# Rebuild the docs-builder container
docker build --file docker/build/Dockerfile --tag docs-builder .
