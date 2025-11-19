---
category: add
command: add_nodes
optional_options:
- alternate: []
  help: The UUIDs of the unconfigured nodes to add to the cluster. The system adds
    nodes to the cluster in the same order that you list them after this flag.
  name: --node-uuids
  required: false
- alternate: []
  help: The IP addresses of the unconfigured nodes to add to the cluster. The system
    adds nodes to the cluster in the same order that you list them after this flag.
  name: --node-ips
  required: false
- alternate:
  - -A
  help: Add all network-connected, unconfigured nodes to the cluster. This flag does
    not allow specifying the order of the nodes and does not apply to cloud clusters.
  name: --all-unconfigured
  required: false
- alternate: []
  help: The stripe configuration to use
  name: --target-stripe-config
  required: false
- alternate: []
  help: 'The minimum node fault tolerance level for the resulting cluster configuration.
    Note: In certain cases, a lower node fault tolerance level can result in higher
    usable capacity'
  name: --target-max-node-failures
  required: false
- alternate: []
  help: Validate the node-add operation and calculate the resulting usable cluster
    capacity. When you use this flag, Qumulo Core does not add nodes or begin to change
    data protection configuration
  name: --dry-run
  required: false
- alternate: []
  help: Begin the node-add operation without asking for confirmation.
  name: --batch
  required: false
permalink: /qq-cli-command-guide/add/add_nodes.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq add_nodes</code> command.
synopsis: Add unconfigured nodes to a Qumulo cluster
title: qq add_nodes
usage: "qq add_nodes [-h] (--node-uuids NODE_UUIDS [NODE_UUIDS ...] | --node-ips NODE_IPS\
  \ [NODE_IPS ...] | --all-unconfigured) [--target-stripe-config BLOCKS_PER_STRIPE\
  \ DATA_BLOCKS_PER_STRIPE] [--target-max-node-failures TARGET_MAX_NODE_FAILURES]\n\
  \    [--dry-run] [--batch]"
zendesk_source: qq CLI Command Guide

---