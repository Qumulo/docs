---
category: snapshot
command: snapshot_unlock_snapshot
keywords: qq, qq_cli, snapshot_unlock_snapshot
optional_options:
- alternate:
  - --id
  help: The identifier of the snapshot to unlock.
  name: -i
  required: true
- alternate:
  - --signature
  help: The verification signature of the security challenge from the output of the
    qq snapshot_get_unlock_challenge command.
  name: -s
  required: false
- alternate:
  - --private-key-file
  help: The location of the private key file that locks the snapshot.
  name: -k
  required: false
permalink: /qq-cli-command-guide/snapshot/snapshot_unlock_snapshot.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq snapshot_unlock_snapshot</code>
  command.
synopsis: Unlock a snapshot.
title: qq snapshot_unlock_snapshot
usage: qq snapshot_unlock_snapshot [-h] -i ID (-s SIGNATURE | -k PRIVATE_KEY_FILE)
zendesk_source: qq CLI Command Guide

---