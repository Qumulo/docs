#!/bin/bash
set -euo pipefail

# Run the docs-builder image to check spelling in the documentation on the mainline branch
docker run --rm --user $(id -u):$(id -g) --name docs-container-proof --volume $(pwd):/src:rw docs-builder proof
