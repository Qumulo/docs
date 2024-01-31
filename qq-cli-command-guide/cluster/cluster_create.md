---
category: cluster
command: cluster_create
keywords: qq, qq_cli, cluster_create
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
  help: Accept the EULA
  name: --accept-eula
  required: false
- alternate: []
  help: Reject the EULA
  name: --reject-eula
  required: false
- alternate: []
  help: EC2 Instance ID of node receiving this request. AWS only.
  name: --host-instance-id
  required: false
- alternate:
  - -U
  help: Cluster node UUIDs
  name: --node-uuids
  required: false
- alternate:
  - -I
  help: Cluster node IPv4 addresses
  name: --node-ips
  required: false
- alternate:
  - -A
  help: Use all discoverable unconfigured nodes to make cluster
  name: --all-unconfigured
  required: false
permalink: /qq-cli-command-guide/cluster/cluster_create.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq cluster_create</code> command.
synopsis: Creates a Qumulo Cluster
title: qq cluster_create
usage: "qq cluster_create [-h] --cluster-name CLUSTER_NAME [--admin-password ADMIN_PASSWORD]\
  \ [--blocks-per-stripe BLOCKS_PER_STRIPE]\n    [--max-drive-failures MAX_DRIVE_FAILURES]\
  \ [--max-node-failures MAX_NODE_FAILURES] [--accept-eula] [--reject-eula]\n    [--host-instance-id\
  \ HOST_INSTANCE_ID]\n    (--node-uuids NODE_UUIDS [NODE_UUIDS ...] | --node-ips\
  \ NODE_IPS [NODE_IPS ...] | --all-unconfigured)"
zendesk_source: qq CLI Command Guide

---