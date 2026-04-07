#!/bin/bash
set -eo pipefail

if [[ "$IS_INTERNAL" != "true" ]]; then
  git config user.email "${GIT_ACTOR}@users.noreply.github.com"
  git config user.name "${GIT_ACTOR}"
fi

git worktree add content gh-pages
rsync -a _site/ content/
git -C content --work-tree . add --all
git -C content --work-tree . commit -m "Rebuilt documentation website" || echo "No changes to commit" >&2
git -C content --work-tree . push --force origin gh-pages
