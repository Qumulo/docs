---
category: network
command: network_mod_interface
optional_options:
- alternate: []
  help: The unique ID of the interface
  name: --interface-id
  required: false
- alternate: []
  help: The default IPv4 gateway address
  name: --default-gateway
  required: false
- alternate: []
  help: The default IPv6 gateway address
  name: --default-gateway-ipv6
  required: false
- alternate: []
  help: Ethernet bonding mode
  name: --bonding-mode
  required: false
- alternate: []
  help: The maximum transfer unit (MTU) in bytes of the interface and any untagged
    STATIC network.
  name: --mtu
  required: false
permalink: /qq-cli-command-guide/network/network_mod_interface.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq network_mod_interface</code>
  command.
synopsis: Modify interface configuration
title: qq network_mod_interface
usage: qq network_mod_interface [-h] [--interface-id INTERFACE_ID] [--default-gateway
  DEFAULT_GATEWAY] [--default-gateway-ipv6 DEFAULT_GATEWAY_IPV6] [--bonding-mode {ACTIVE_BACKUP,IEEE_8023AD}]
  [--mtu MTU]
zendesk_source: qq CLI Command Guide

---