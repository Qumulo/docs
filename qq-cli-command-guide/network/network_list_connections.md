---
category: network
command: network_list_connections
optional_options:
- alternate:
  - --counts
  help: Pretty-print connection counts for the cluster and each node
  name: -c
  required: false
- alternate: []
  help: Print json instead of default pretty-printed connection table
  name: --json
  required: false
permalink: /qq-cli-command-guide/network/network_list_connections.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq network_list_connections</code>
  command.
synopsis: Get the list of SMB and NFS protocol connections per node.
title: qq network_list_connections
usage: qq network_list_connections [-h] [-c | --json]
zendesk_source: qq CLI Command Guide

---

## Examples
To ensure the optimal performance of your cluster, its client connections must be distributed evenly.

### To View Client Connections in JSON Format
Run the `qq network_list_connections` command to list the IP address and protocol for each client.

{{site.exampleOutput}}

```json
[{
  "connections": [{
    "network_address": "{{site.exampleIP0}}",
    "type": "CONNECTION_TYPE_SMB"
  },{
    "network_address": "{{site.exampleIP1}}",
    "type": "CONNECTION_TYPE_NFS"
  }],
  "id": 1
 },
 ...
]
```

### To View the Client Connection Counts
Run the `qq network_list_connections` command and use the `--counts` flag to view the balance of client connections.

{% include note.html content="Using the `--counts` flag returns only the SMB and NFS connections without the client IP addresses." %}

{{site.exampleOutput}}

```
Total: SMB 70 NFS 30
Node1: SMB 17 NFS 8
Node2: SMB 17 NFS 7
Node3: SMB 18 NFS 6
Node4: SMB 18 NFS 9
```
