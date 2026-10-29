---
category: ad
command: ad_reconfigure
optional_options:
- alternate: []
  help: Allows the cluster to search trusted domains for user information.
  name: --enable-search-trusted-domains
  required: false
- alternate: []
  help: Disallows the cluster from using trusted domains for user information. Disabling
    may prevent the cluster from finding all relevant user and group membership data
    for authenticated users.
  name: --disable-search-trusted-domains
  required: false
- alternate: []
  help: Use AD POSIX attributes.
  name: --enable-ad-posix-attributes
  required: false
- alternate: []
  help: Do not use AD POSIX attributes.
  name: --disable-ad-posix-attributes
  required: false
- alternate: []
  help: When using AD POSIX extensions, query using this base DN
  name: --base-dn
  required: false
- alternate: []
  help: A single fully qualified domain name (FQDN) or a comma-separated list of FQDNs
    of the domain controllers (DCs) to use for LDAP queries and Netlogon authentication
    (for example, dc1.example.com). When you use this flag, the specified FQDN overrides
    the system's default discovery of DCs for the joined domain. When you specify
    multiple FQDNs in order of preference, Qumulo Core uses only one DC at a time
    and falls back to the remaining DCs if one of the FQDNs becomes unreachable.
  name: --domain-controllers
  required: false
- alternate: []
  help: Do not wait for the operation to complete
  name: --no-wait
  required: false
permalink: /qq-cli-command-guide/ad/ad_reconfigure.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq ad_reconfigure</code> command.
synopsis: Reconfigure Active Directory POSIX Attributes
title: qq ad_reconfigure
usage: "qq ad_reconfigure [-h] [--enable-search-trusted-domains | --disable-search-trusted-domains]\
  \ [--enable-ad-posix-attributes | --disable-ad-posix-attributes]\n    [--base-dn\
  \ BASE_DN] [--domain-controllers DOMAIN_CONTROLLERS] [--no-wait]"
zendesk_source: qq CLI Command Guide

---