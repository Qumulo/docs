---
category: replication
command: replication_reverse_target_relationship
keywords: qq, qq_cli, replication_reverse_target_relationship
optional_options:
- alternate: []
  help: Unique identifier of the target replication relationship
  name: --id
  required: true
- alternate: []
  help: The IP address of the current source cluster
  name: --source-address
  required: true
- alternate: []
  help: Network port of the current source cluster (defaults to 3712)
  name: --source-port
  required: false
permalink: /qq-cli-command-guide/replication/replication_reverse_target_relationship.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq replication_reverse_target_relationship</code>
  command.
synopsis: Reverse source and target for a replication relationship.
title: qq replication_reverse_target_relationship
usage: "qq replication_reverse_target_relationship [-h] --id ID --source-address SOURCE_ADDRESS\n\
  \    [--source-port SOURCE_PORT]"

---