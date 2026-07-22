---
category: fs
command: fs_walk_tree
optional_options:
- alternate: []
  help: Tree root path
  name: --path
  required: false
- alternate: []
  help: Snapshot ID to read from
  name: --snapshot
  required: false
- alternate: []
  help: Only display files
  name: --file-only
  required: false
- alternate: []
  help: Only display directories
  name: --directory-only
  required: false
- alternate: []
  help: Only display symlinks
  name: --symlink-only
  required: false
- alternate: []
  help: Display detailed owner and group information
  name: --display-ownership
  required: false
- alternate: []
  help: Display all attributes
  name: --display-all-attributes
  required: false
- alternate: []
  help: Output aggregate summary as JSON
  name: --summary
  required: false
- alternate: []
  help: Output a file at the specified path instead of stdout
  name: --output-file
  required: false
- alternate: []
  help: The maximum layers to traverse down the tree, starting from the path specified.
    For example, if the file tree is /dir/file, running the command with max-depth
    of 1 from root will yield / and /dir
  name: --max-depth
  required: false
- alternate: []
  help: Show progress bar (requires --output-file or --summary)
  name: --progress
  required: false
- alternate:
  - --max-bytes-per-file
  help: Fetch at most this many bytes per file
  name: -m
  required: false
- alternate: []
  help: Fetch each file server-side to warm caches without transferring data
  name: --fetch-data
  required: false
permalink: /qq-cli-command-guide/fs/fs_walk_tree.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_walk_tree</code> command.
synopsis: Walk file system tree
title: qq fs_walk_tree
usage: "qq fs_walk_tree [-h] [--path PATH] [--snapshot SNAPSHOT] [--file-only | --directory-only\
  \ | --symlink-only] [--display-ownership | --display-all-attributes | --summary]\n\
  \    [--output-file OUTPUT_FILE] [--max-depth MAX_DEPTH] [--progress] [-m MAX_BYTES_PER_FILE]\
  \ [--fetch-data]"
zendesk_source: qq CLI Command Guide

---

## Examples

{% include content-reuse/cli-guide/recursive-acl-template-smb-attributes.md %}
