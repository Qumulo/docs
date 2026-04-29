#!/bin/bash
set -eo pipefail

if [[ "$IS_INTERNAL" != "true" ]]; then
  git config user.email "${GIT_ACTOR}@users.noreply.github.com"
  git config user.name "${GIT_ACTOR}"
fi

git worktree add content gh-pages
# Ensure that pushes to `docs-internal` do not publish to `/hardware-guide`.
if [[ "$IS_INTERNAL" != "true" ]]; then
  rsync -a _site/ content/
else
  rsync -a _site/ content/ --exclude="hardware-guide/"
fi
git -C content --work-tree . add --all
git -C content --work-tree . commit -m "Rebuilt documentation website" || echo "No changes to commit" >&2
git -C content --work-tree . push --force origin gh-pages
