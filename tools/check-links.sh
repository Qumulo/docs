#!/bin/bash
set -euo pipefail

bundle exec jekyll build -d _site

LYCHEE_ARGS=(
    "--root-dir" "/src/_site"
    "--exclude-path" "\.xml$"
    "--remap" "https://docs\.qumulo\.com/ file:///src/_site/"
    "--max-retries" "3"
    "--retry-wait-time" "2"
    "--accept" "200..=299,429,503"
    "--max-concurrency" "4"
)

if [ "${GITHUB_ACTIONS:-}" = "true" ]; then
    LYCHEE_ARGS+=("--no-progress")
fi

lychee "${LYCHEE_ARGS[@]}" "_site"
