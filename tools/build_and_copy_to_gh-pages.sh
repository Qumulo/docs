#!/bin/bash

# Ensure we're in the root of the repo
cd "$(git rev-parse --show-toplevel)"

# Abort if there are uncommitted changes
if ! git diff --quiet || ! git diff --cached --quiet; then
  echo "Uncommitted changes detected. Exiting..." >&2
  exit 3
fi

# Rebuild gems
docker run -ti --user $(id -u):$(id -g) --entrypoint /bin/bash -v $(pwd):/src docs-builder -c "bundle update --bundler; bundle install"

# Build documentation into _site on mainline
docker run --rm --user "$(id -u):$(id -g)" --name docs-container-build -v "$(pwd)":/src:rw docs-builder

# Save current git user config
OLD_NAME=$(git config --global user.name || echo "")
OLD_EMAIL=$(git config --global user.email || echo "")

# Restore git config on exit
trap '
  if [[ -n "$OLD_NAME" ]]; then
    git config --global user.name "$OLD_NAME"
  else
    git config --global --unset user.name
  fi
  if [[ -n "$OLD_EMAIL" ]]; then
    git config --global user.email "$OLD_EMAIL"
  else
    git config --global --unset user.email
  fi
' EXIT

# Set temporary git user config values
git config --global user.name "Qontent Automation"
git config --global user.email "qontent@qumulo.com"

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

# Copy from _site into current branch (repo root)
if [[ ! -d "_site" ]]; then
  echo "_site directory doesn't exist. Exiting..." >&2
  exit 2
fi

if [[ $DRY_RUN -eq 1 ]]; then
  echo "Dry-run mode: previewing file copy..."
  rsync -av --dry-run _site/ .
else
  rsync -av _site/ .
  rm -rf _site
fi

# Commit changes (unless dry-run)
if [[ $DRY_RUN -eq 0 ]]; then
  git add --all
  git commit -m "Copying rebuilt documentation website" || echo "No changes to commit" >&2
else
  echo "Dry-run mode: skipping git commit."
fi

