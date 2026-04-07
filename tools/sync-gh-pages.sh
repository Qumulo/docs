#!/bin/bash
set -eo pipefail

git worktree add content gh-pages

rsync -a _site/ content/

git -C content --work-tree . add --all
git -C content --work-tree . commit -m "Rebuilt documentation website" || echo "No changes to commit" >&2

# Force push internal `gh-pages` branch to public `gh-pages` branch
git -C content --work-tree . push --force origin gh-pages  
