#!/bin/bash
set -eo pipefail

# Run the docs-builder image to build the documentation on the mainline branch
docker run --rm --user "$(id -u):$(id -g)" --name docs-container-build --volume "$(pwd)":/src:rw docs-builder

# Check for dry-run mode
DRY_RUN=0
if [[ "$1" == "--dry-run" ]]; then
  DRY_RUN=1
fi

# Check out gh-pages branch
if ! git checkout gh-pages; then
  echo "Couldn't check out gh-pages branch. Exiting..." >&2
  exit 1
fi

# Ensure we are at the repo's root
REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

# Check whether _site exists
if [[ ! -d "_site" ]]; then
  echo "_site directory doesn't exist. Exiting..." >&2
  exit 2
fi

# Copy from _site into current branch (repo root)
if [[ $DRY_RUN -eq 1 ]]; then
  echo "Dry-run mode: previewing file copy..."
  rsync -av --dry-run _site/ .
else
  rsync -av _site/ .
  rm -rf _site
fi
