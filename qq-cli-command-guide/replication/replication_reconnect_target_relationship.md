---
category: replication
command: replication_reconnect_target_relationship
keywords: qq, qq_cli, replication_reconnect_target_relationship
optional_options:
- alternate: []
  help: Unique identifier of the target replication relationship
  name: --id
  required: true
- alternate: []
  help: Do not prompt
  name: --force
  required: false
permalink: /qq-cli-command-guide/replication/replication_reconnect_target_relationship.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq replication_reconnect_target_relationship</code>
  command.
synopsis: Make the target directory read-only and revert any changes made to the target
  directory since the latest recovery point. Then reconnect the specified target replication
  relationship with its source directory. The revert action may take some time to
  complete before replication is resumed.
title: qq replication_reconnect_target_relationship
usage: qq replication_reconnect_target_relationship [-h] --id ID [--force]

---