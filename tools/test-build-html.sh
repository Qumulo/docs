#!/bin/bash
set -eo pipefail

# Run the docs-builder image to build the documentation on the mainline branch
docker run --rm --user "$(id -u):$(id -g)" --name docs-container-build --volume "$(pwd)":/src:rw docs-builder

#### We want to sync from external repos to specific folders
if [ ! -z "$EXTERNAL_REPOS" ]; then
  echo "$EXTERNAL_REPOS" | jq -c '.[]' | while read -r item; do
    repo=$(echo "$item" | jq -r '.repo')
    path=$(echo "$item" | jq -r '.path')

    tmpdir=$(mktemp -d)
    git clone --branch gh-pages --single-branch --depth 1 "${repo}" "${tmpdir}"
    # sync only the hardware folder and its contents to _site
    rsync -a "${tmpdir}/${path}" _site/
  done
fi

# Build sitemap.xml
if [[ -z "${GITHUB_ACTIONS:-}" ]]; then
  echo "Skipping sitemap generation (non-GitHub Actions build)"
else
  python3 ./tools/gen-sitemap.py
fi
