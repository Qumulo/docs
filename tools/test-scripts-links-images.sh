#!/bin/bash
set -euo pipefail

# Run the docs-builder image to check scripts, links, and images in the documentation on the mainline branch
docker run --rm --user $(id -u):$(id -g) --name docs-container-check --volume $(pwd):/src:rw -e GITHUB_ACTIONS docs-builder check
