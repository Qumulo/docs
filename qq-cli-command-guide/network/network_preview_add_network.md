---
category: network
command: network_preview_add_network
optional_options:
- alternate: []
  help: Network ID
  name: --network-id
  required: true
- alternate: []
  help: Network name
  name: --name
  required: true
- alternate: []
  help: The tenant that the network will be assigned to. If only one tenant exists,
    the network will default to that tenant. Otherwise, not specifying the tenant
    will create the network unassigned.
  name: --tenant-id
  required: false
permalink: /qq-cli-command-guide/network/network_preview_add_network.html
positional_options:
- help: The kind of network you want to add.
  name: assigned_by
  required: true
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq network_preview_add_network</code>
  command.
synopsis: Add a network to the cluster-wide network config.
title: qq network_preview_add_network
usage: qq network_preview_add_network [-h] --network-id NETWORK_ID --name NAME [--tenant-id
  TENANT_ID] {host_managed,dhcp,static} ...
zendesk_source: qq CLI Command Guide

---