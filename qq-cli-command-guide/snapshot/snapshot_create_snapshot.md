---
category: snapshot
command: snapshot_create_snapshot
keywords: qq, qq_cli, snapshot_create_snapshot
optional_options:
- alternate: []
  help: ID of directory to snapshot
  name: --source-file-id
  required: false
- alternate: []
  help: Path of directory to snapshot
  name: --path
  required: false
- alternate:
  - --expiration
  help: Time of snapshot expiration. An empty string indicates that the snapshot never
    expires. The time format follows RFC 3339, a normalized subset of ISO 8601.
  name: -e
  required: false
- alternate:
  - --name
  help: Snapshot name
  name: -n
  required: false
permalink: /qq-cli-command-guide/snapshot/snapshot_create_snapshot.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq snapshot_create_snapshot</code>
  command.
synopsis: Create a new snapshot
title: qq snapshot_create_snapshot
usage: qq snapshot_create_snapshot [-h] [--source-file-id SOURCE_FILE_ID | --path
  PATH] [-e EXPIRATION] [-n NAME]
zendesk_source: qq CLI Command Guide

---