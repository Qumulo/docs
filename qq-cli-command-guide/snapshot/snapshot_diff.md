---
category: snapshot
command: snapshot_diff
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
  help: Max snapshot diff entries to return per request
  name: --page-size
  required: false
permalink: /qq-cli-command-guide/snapshot/snapshot_diff.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq snapshot_diff</code> command.
synopsis: List the changed files and directories between two snapshots.
title: qq snapshot_diff
usage: qq snapshot_diff [-h] --newer-snapshot NEWER_SNAPSHOT --older-snapshot OLDER_SNAPSHOT
  [--page-size PAGE_SIZE]
zendesk_source: qq CLI Command Guide

---