---
category: fs
command: fs_fetch_tree
optional_options:
- alternate: []
  help: Tree root path
  name: --path
  required: true
- alternate: []
  help: Disable progress bar
  name: --no-progress
  required: false
- alternate: []
  help: Maximum depth to traverse
  name: --max-depth
  required: false
- alternate:
  - --max-bytes-per-file
  help: Fetch at most this many bytes per file
  name: -m
  required: false
permalink: /qq-cli-command-guide/fs/fs_fetch_tree.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_fetch_tree</code> command.
synopsis: Fetch file data into cluster caches for an entire file tree
title: qq fs_fetch_tree
usage: qq fs_fetch_tree [-h] --path PATH [--no-progress] [--max-depth MAX_DEPTH] [-m
  MAX_BYTES_PER_FILE]
zendesk_source: qq CLI Command Guide

---