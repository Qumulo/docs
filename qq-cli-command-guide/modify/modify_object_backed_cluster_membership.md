---
category: modify
command: modify_object_backed_cluster_membership
optional_options:
- alternate: []
  help: 'The node ips and fault domains of the new and existing nodes expected to
    remain in

    the cluster after the modification. Parsed as comma delimited tuples <ip-1>,<fault

    domain-1> <ip-2>,<fault domain-2>...To specify a non-fault domain aware cluster,

    provide None in place of the fault domain ids <ip-1>,None <ip-2>,None

    <ip-3>,None...The fault domain of an existing node cannot be changed.

    '
  name: --node-ips-and-fault-domains
  required: false
- alternate: []
  help: Begin the cluster modification operation without asking for confirmation.
  name: --batch
  required: false
- alternate: []
  help: 'Validate the cluster modification operation and return information about
    the

    resulting cluster. When you use this flag, Qumulo Core does not perform the cluster

    modification.

    '
  name: --dry-run
  required: false
permalink: /qq-cli-command-guide/modify/modify_object_backed_cluster_membership.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq modify_object_backed_cluster_membership</code>
  command.
synopsis: Modify the membership of an object backed cluster by specifying the desired
  list of nodes expected to be part of the cluster after the modification. The nodes
  to be added, removed, or replaced are implicitly derived using the specified target
  membership and the current membership of the cluster.
title: qq modify_object_backed_cluster_membership
usage: qq modify_object_backed_cluster_membership [-h] --node-ips-and-fault-domains
  NODE_IPS_AND_FAULT_DOMAINS [NODE_IPS_AND_FAULT_DOMAINS ...] [--batch] [--dry-run]
zendesk_source: qq CLI Command Guide

---