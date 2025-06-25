---
category: network
command: network_preview_delete_network
optional_options:
- alternate: []
  help: Network to delete
  name: --network-id
  required: true
- alternate: []
  help: Delete the vlan associated with the specified network if it is the only network
    on the VLAN.
  name: --delete-orphaned-vlans
  required: false
permalink: /qq-cli-command-guide/network/network_preview_delete_network.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq network_preview_delete_network</code>
  command.
synopsis: Delete a network from the cluster-wide network config.
title: qq network_preview_delete_network
usage: qq network_preview_delete_network [-h] --network-id NETWORK_ID [--delete-orphaned-vlans]
zendesk_source: qq CLI Command Guide

---