#!/bin/bash
set -euo pipefail

# Check for loose .md files and files not linked to the sidebar correctly
docker run -i --rm --user $(id -u):$(id -g) --name docs-container-proof -v $(pwd):/src:rw docs-builder sidebar
