---
category: snapshot
command: snapshot_get_capacity_used_per_snapshot
optional_options:
- alternate:
  - --id
  help: If set, will return capacity usage of the snapshot with the specified id.
    If omitted, will return capacity usage of all snapshots.
  name: -i
  required: false
permalink: /qq-cli-command-guide/snapshot/snapshot_get_capacity_used_per_snapshot.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq snapshot_get_capacity_used_per_snapshot</code>
  command.
synopsis: Get the approximate amount of space for each snapshot that would be reclaimed
  if that snapshot were deleted.
title: qq snapshot_get_capacity_used_per_snapshot
usage: qq snapshot_get_capacity_used_per_snapshot [-h] [-i ID]
zendesk_source: qq CLI Command Guide

---