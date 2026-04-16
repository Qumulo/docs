---
category: fs
command: fs_fetch_file
optional_options:
- alternate: []
  help: File path
  name: --path
  required: false
- alternate: []
  help: File ID
  name: --id
  required: false
- alternate: []
  help: Show progress bar on stderr
  name: --progress
  required: false
- alternate:
  - --max-bytes
  help: Fetch at most this many bytes
  name: -m
  required: false
permalink: /qq-cli-command-guide/fs/fs_fetch_file.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_fetch_file</code> command.
synopsis: Fetch file data into cluster caches
title: qq fs_fetch_file
usage: qq fs_fetch_file [-h] (--path PATH | --id ID) [--progress] [-m MAX_BYTES]
zendesk_source: qq CLI Command Guide

---