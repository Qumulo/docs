---
category: network
command: network_mod_network
optional_options:
- alternate: []
  help: The unique ID of the network on the interface
  name: --network-id
  required: true
- alternate: []
  help: Network name
  name: --name
  required: false
- alternate: []
  help: How to assign IP address, either DHCP or STATIC
  name: --assigned-by
  required: false
- alternate: []
  help: (if STATIC) IPv4 or IPv6 Netmask or Subnet CIDR eg. 255.255.255.0 or 10.1.1.0/24
  name: --netmask
  required: false
- alternate: []
  help: (if STATIC) List of persistent IP ranges to replace the current ranges. Can
    be single addresses or ranges, comma separated. eg. 10.1.1.20-21 or 10.1.1.20,10.1.1.21
  name: --ip-ranges
  required: false
- alternate: []
  help: (if STATIC) List of floating IP ranges to replace the current ranges. Can
    be single addresses or ranges, comma separated. eg. 10.1.1.20-21 or 10.1.1.20,10.1.1.21
  name: --floating-ip-ranges
  required: false
- alternate: []
  help: (if STATIC) Clear the floating IP address ranges
  name: --clear-floating-ip-ranges
  required: false
- alternate: []
  help: List of DNS Server IP addresses to replace the current ranges. Can be a single
    address or multiple comma separated addresses. eg. 10.1.1.10 or 10.1.1.10,10.1.1.15
  name: --dns-servers
  required: false
- alternate: []
  help: Clear the DNS servers
  name: --clear-dns-servers
  required: false
- alternate: []
  help: List of DNS Search Domains to replace the current domains. Can be a single
    domain or multiple comma separated domains. eg. my.domain.com or my.domain.com,your.domain.com
  name: --dns-search-domains
  required: false
- alternate: []
  help: Clear the DNS search domains
  name: --clear-dns-search-domains
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
  help: The tenant that the network is assigned to. If only one tenant exists, this
    will default to that tenant.
  name: --tenant-id
  required: false
- alternate: []
  help: Clear the tenant from the network, making the network unassigned
  name: --clear-tenant-id
  required: false
permalink: /qq-cli-command-guide/network/network_mod_network.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq network_mod_network</code>
  command.
synopsis: Modify network configuration
title: qq network_mod_network
usage: "qq network_mod_network [-h] --network-id NETWORK_ID [--name NAME] [--assigned-by\
  \ {DHCP,STATIC}] [--netmask <netmask-or-subnet>] [--ip-ranges <address-or-range>\
  \ [<address-or-range> ...]]\n    [--floating-ip-ranges <address-or-range> [<address-or-range>\
  \ ...]] [--clear-floating-ip-ranges] [--dns-servers <address-or-range> [<address-or-range>\
  \ ...]] [--clear-dns-servers]\n    [--dns-search-domains <search-domain> [<search-domain>\
  \ ...]] [--clear-dns-search-domains] [--mtu MTU] [--vlan-id VLAN_ID] [--tenant-id\
  \ TENANT_ID | --clear-tenant-id]"
zendesk_source: qq CLI Command Guide

---