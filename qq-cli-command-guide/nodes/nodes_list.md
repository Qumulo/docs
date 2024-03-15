---
category: nodes
command: nodes_list
optional_options:
- alternate: []
  help: Node ID
  name: --node
  required: false
permalink: /qq-cli-command-guide/nodes/nodes_list.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq nodes_list</code> command.
synopsis: List nodes
title: qq nodes_list
usage: qq nodes_list [-h] [--node NODE]
zendesk_source: qq CLI Command Guide

---

## Examples

### To List Information about Nodes in Your Cluster
Run the `qq nodes_list` command.

{{site.exampleOutput}} This example shows a cluster with 4 nodes.

```json
[{
  "id": 1,
  "label": "{{site.exampleMAC1}}",
  "model_number": "Q0626",
  "node_name": "qumulo-1",
  "node_status": "online",
  "uuid": "{{site.exampleUUID41}}"
},{
  "id": 2,
  "label": "{{site.exampleMAC2}}",
  "model_number": "Q0626",
  "node_name": "qumulo-2",
  "node_status": "online",
  "uuid": "{{site.exampleUUID42}}"
},{
  "id": 3,
  "label": "{{site.exampleMAC3}}",
  "model_number": "Q0626",
  "node_name": "qumulo-3",
  "node_status": "online",
  "uuid": "{{site.exampleUUID43}}"
},{
  "id": 4,
  "label": "{{site.exampleMAC4}}",
  "model_number": "Q0626",
  "node_name": "qumulo-4",
  "node_status": "online",
  "uuid": "{{site.exampleUUID44}}"
}]
```
