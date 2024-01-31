---
category: fs
command: fs_copy
keywords: qq, qq_cli, fs_copy
optional_options:
- alternate: []
  help: Snapshot ID to copy from
  name: --source-snapshot
  required: false
- alternate: []
  help: Overwrite an existing target file
  name: --overwrite
  required: false
- alternate: []
  help: Do not show progress bar
  name: --quiet
  required: false
- alternate: []
  help: Do not copy file attributes and ACLs in addition to data
  name: --no-attributes
  required: false
- alternate: []
  help: Do not copy named streams
  name: --no-named-streams
  required: false
permalink: /qq-cli-command-guide/fs/fs_copy.html
positional_options:
- help: Source file absolute path
  name: source
  required: true
- help: Target file absolute path
  name: target
  required: true
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_copy</code> command.
synopsis: Server-side copy a file.
title: qq fs_copy
usage: qq fs_copy [-h] [--source-snapshot SOURCE_SNAPSHOT] [--overwrite] [--quiet]
  [--no-attributes] [--no-named-streams] source target
zendesk_source: qq CLI Command Guide

---