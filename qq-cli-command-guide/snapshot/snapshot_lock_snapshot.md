---
category: snapshot
command: snapshot_lock_snapshot
optional_options:
- alternate:
  - --id
  help: The identifier of the snapshot to lock.
  name: -i
  required: true
- alternate:
  - --force
  help: Do not prompt for confirmation. The default setting is "false".
  name: -f
  required: false
- alternate:
  - --lock-key
  help: 'The identifier or name of the key in the file system key store that protects
    the snapshot. Important: You must specify either the name or the identifier of
    the key.'
  name: -k
  required: true
permalink: /qq-cli-command-guide/snapshot/snapshot_lock_snapshot.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq snapshot_lock_snapshot</code>
  command.
synopsis: Lock a snapshot.
title: qq snapshot_lock_snapshot
usage: qq snapshot_lock_snapshot [-h] -i ID [-f] -k LOCK_KEY
zendesk_source: qq CLI Command Guide

---