---
category: snapshot
command: snapshot_modify_snapshot
keywords: qq, qq_cli, snapshot_modify_snapshot
optional_options:
- alternate:
  - --id
  help: Identifier of the snapshot to modify.
  name: -i
  required: true
- alternate:
  - --expiration
  help: Time of snapshot expiration. An empty string indicates that the snapshot never
    expires. The time format follows RFC 3339, a normalized subset of ISO 8601.
  name: -e
  required: false
- alternate:
  - --force
  help: Do not prompt for confirmation. The default setting is "false".
  name: -f
  required: false
permalink: /qq-cli-command-guide/snapshot/snapshot_modify_snapshot.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq snapshot_modify_snapshot</code>
  command.
synopsis: Modify an existing snapshot
title: qq snapshot_modify_snapshot
usage: qq snapshot_modify_snapshot [-h] -i ID [-e EXPIRATION] [-f]
zendesk_source: qq CLI Command Guide

---