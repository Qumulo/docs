---
category: network
command: network_add_network
optional_options:
- alternate: []
  help: Network name
  name: --name
  required: true
- alternate: []
  help: (if STATIC) IPv4 or IPv6 Netmask or Subnet CIDR eg. 255.255.255.0 or 10.1.1.0/24
  name: --netmask
  required: true
- alternate: []
  help: (if STATIC) List of persistent IP ranges to replace the current ranges. Can
    be single addresses or ranges, comma separated. eg. 10.1.1.20-21 or 10.1.1.20,10.1.1.21
  name: --ip-ranges
  required: true
- alternate: []
  help: (if STATIC) List of floating IP ranges to replace the current ranges. Can
    be single addresses or ranges, comma separated. eg. 10.1.1.20-21 or 10.1.1.20,10.1.1.21
  name: --floating-ip-ranges
  required: false
- alternate: []
  help: List of DNS Server IP addresses. Can be a single address or multiple comma
    separated addresses. eg. 10.1.1.10 or 10.1.1.10,10.1.1.15
  name: --dns-servers
  required: false
- alternate: []
  help: List of DNS Search Domains to use. Can be a single domain or multiple comma
    separated domains. eg. my.domain.com or my.domain.com,your.domain.com
  name: --dns-search-domains
  required: false
- alternate: []
  help: (if STATIC) The Maximum Transfer Unit (MTU) in bytes of a tagged STATIC network.
    The MTU of an untagged STATIC network needs to be specified through interface
    MTU.
  name: --mtu
  required: false
- alternate: []
  help: (if STATIC) User assigned VLAN tag for network configuration. 1-4094 are valid
    VLAN IDs and 0 is used for untagged networks.
  name: --vlan-id
  required: false
- alternate: []
  help: The tenant that the network will be assigned to. If only one tenant exists,
    the network will default to that tenant. Otherwise, not specifying the tenant
    will create the network unassigned.
  name: --tenant-id
  required: false
permalink: /qq-cli-command-guide/network/network_add_network.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq network_add_network</code>
  command.
synopsis: Add network configuration
title: qq network_add_network
usage: "qq network_add_network [-h] --name NAME --netmask <netmask-or-subnet> --ip-ranges\
  \ <address-or-range> [<address-or-range> ...] [--floating-ip-ranges <address-or-range>\
  \ [<address-or-range> ...]]\n    [--dns-servers <address-or-range> [<address-or-range>\
  \ ...]] [--dns-search-domains <search-domain> [<search-domain> ...]] [--mtu MTU]\
  \ [--vlan-id VLAN_ID] [--tenant-id TENANT_ID]"
zendesk_source: qq CLI Command Guide

---