---
category: data
command: data_core_cluster_create
optional_options:
- alternate:
  - -n
  help: Cluster Name
  name: --cluster-name
  required: true
- alternate:
  - -p
  help: Administrator Password
  name: --admin-password
  required: true
- alternate: []
  help: Accept the EULA
  name: --accept-eula
  required: false
- alternate: []
  help: Reject the EULA
  name: --reject-eula
  required: false
- alternate: []
  help: Cluster node UUIDs
  name: --node-uuids
  required: false
- alternate: []
  help: Erasure coding stripe width
  name: --blocks-per-stripe
  required: false
- alternate: []
  help: Maximum allowable drive failures
  name: --max-drive-failures
  required: false
- alternate: []
  help: Maximum allowable node failures
  name: --max-node-failures
  required: false
- alternate: []
  help: Use all discoverable unconfigured nodes to make cluster
  name: --all-unconfigured
  required: false
permalink: /qq-cli-command-guide/data/data_core_cluster_create.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq data_core_cluster_create</code>
  command.
synopsis: Creates a Qumulo Data-Core Cluster
title: qq data_core_cluster_create
usage: "qq data_core_cluster_create [-h] --cluster-name CLUSTER_NAME --admin-password\
  \ ADMIN_PASSWORD [--accept-eula] [--reject-eula] [--node-uuids NODE_UUIDS [NODE_UUIDS\
  \ ...]]\n    [--blocks-per-stripe BLOCKS_PER_STRIPE] [--max-drive-failures MAX_DRIVE_FAILURES]\
  \ [--max-node-failures MAX_NODE_FAILURES] [--all-unconfigured]"
zendesk_source: qq CLI Command Guide

---