---
category: dns
command: dns_modify_system_config
optional_options:
- alternate: []
  help: List of DNS Server IP addresses. Can be a single address or multiple comma
    separated addresses. eg. 10.1.1.10 or 10.1.1.10,10.1.1.15
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
permalink: /qq-cli-command-guide/dns/dns_modify_system_config.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq dns_modify_system_config</code>
  command.
synopsis: Modify the system's DNS configuration.
title: qq dns_modify_system_config
usage: qq dns_modify_system_config [-h] [--dns-servers <address-or-range> [<address-or-range>
  ...] | --clear-dns-servers] [--dns-search-domains <search-domain> [<search-domain>
  ...] | --clear-dns-search-domains]
zendesk_source: qq CLI Command Guide

---