---
category: network
command: network_preview_modify_network
optional_options:
- alternate: []
  help: Network ID
  name: --network-id
  required: true
- alternate: []
  help: Network name
  name: --name
  required: false
- alternate: []
  help: The tenant that the network will be assigned to. If only one tenant exists,
    the network will default to that tenant. Otherwise, not specifying the tenant
    will create the network unassigned.
  name: --tenant-id
  required: false
- alternate: []
  help: Clear the tenant from the network, making the network unassigned
  name: --clear-tenant-id
  required: false
permalink: /qq-cli-command-guide/network/network_preview_modify_network.html
positional_options:
- help: The kind of network you want to add.
  name: assigned_by
  required: true
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq network_preview_modify_network</code>
  command.
synopsis: Modify a network in the cluster-wide network config.
title: qq network_preview_modify_network
usage: qq network_preview_modify_network [-h] --network-id NETWORK_ID [--name NAME]
  [--tenant-id TENANT_ID | --clear-tenant-id] {host_managed,dhcp,static} ...
zendesk_source: qq CLI Command Guide

---