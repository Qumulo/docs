---
category: replication
command: replication_set_snapshot_policy_replication_mode
keywords: qq, qq_cli, replication_set_snapshot_policy_replication_mode
optional_options:
- alternate: []
  help: Unique identifier of the source replication relationship.
  name: --id
  required: true
- alternate: []
  help: Replication mode to set.
  name: --mode
  required: true
permalink: /qq-cli-command-guide/replication/replication_set_snapshot_policy_replication_mode.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq replication_set_snapshot_policy_replication_mode</code>
  command.
synopsis: Set the replication mode of the specified source replication relationship.
  This command is only for a relationship that has linked snapshot policies.
title: qq replication_set_snapshot_policy_replication_mode
usage: "qq replication_set_snapshot_policy_replication_mode [-h] --id ID --mode\n\
  \    {REPLICATION_SNAPSHOT_POLICY,REPLICATION_SNAPSHOT_POLICY_WITH_CONTINUOUS}"

---