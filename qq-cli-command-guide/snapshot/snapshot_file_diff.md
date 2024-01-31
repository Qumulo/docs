---
category: snapshot
command: snapshot_file_diff
keywords: qq, qq_cli, snapshot_file_diff
optional_options:
- alternate: []
  help: Snapshot ID of the newer snapshot
  name: --newer-snapshot
  required: true
- alternate: []
  help: Snapshot ID of the older snapshot
  name: --older-snapshot
  required: true
- alternate: []
  help: Path to file
  name: --path
  required: false
- alternate: []
  help: File ID
  name: --file-id
  required: false
- alternate: []
  help: Maximum number of entries to return per request
  name: --page-size
  required: false
permalink: /qq-cli-command-guide/snapshot/snapshot_file_diff.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq snapshot_file_diff</code> command.
synopsis: List changed byte ranges of a file between two snapshots.
title: qq snapshot_file_diff
usage: "qq snapshot_file_diff [-h] --newer-snapshot NEWER_SNAPSHOT --older-snapshot\
  \ OLDER_SNAPSHOT (--path PATH | --file-id FILE_ID)\n    [--page-size PAGE_SIZE]"
zendesk_source: qq CLI Command Guide

---