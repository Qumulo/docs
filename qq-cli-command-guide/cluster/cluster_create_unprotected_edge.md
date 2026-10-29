---
category: cluster
command: cluster_create_unprotected_edge
optional_options:
- alternate:
  - -n
  help: Edge Device Name
  name: --edge-cluster-name
  required: true
- alternate:
  - -p
  help: Administrator Password
  name: --admin-password
  required: false
- alternate: []
  help: Accept the EULA
  name: --accept-eula
  required: false
- alternate: []
  help: Reject the EULA
  name: --reject-eula
  required: false
permalink: /qq-cli-command-guide/cluster/cluster_create_unprotected_edge.html
positional_options: []
redirect_from:
- /qq-cli-command-guide/unprotected/unprotected_edge_cluster_create.html
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq cluster_create_unprotected_edge</code>
  command.
synopsis: Creates a Single-Node Unprotected Qumulo Edge Device
title: qq cluster_create_unprotected_edge
usage: qq cluster_create_unprotected_edge [-h] --edge-cluster-name EDGE_CLUSTER_NAME
  [--admin-password ADMIN_PASSWORD] [--accept-eula] [--reject-eula]
zendesk_source: qq CLI Command Guide

---