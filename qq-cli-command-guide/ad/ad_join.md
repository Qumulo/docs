---
category: ad
command: ad_join
optional_options:
- alternate:
  - --domain
  help: Fully-qualified name of Active Directory Domain
  name: -d
  required: true
- alternate:
  - --username
  help: Domain user to perform the operation, e.g., Administrator
  name: -u
  required: true
- alternate:
  - --password
  help: Domain password (insecure, visible via ps)
  name: -p
  required: false
- alternate: []
  help: NetBIOS name of the domain. By default, the first part of the domain name
    is used.
  name: --domain-netbios
  required: false
- alternate:
  - --ou
  help: Organizational Unit to join to
  name: -o
  required: false
- alternate: []
  help: Disallows the cluster from using trusted domains for user information. Disabling
    may prevent the cluster from finding all relevant user and group membership data
    for authenticated users.
  name: --disable-search-trusted-domains
  required: false
- alternate: []
  help: Use AD POSIX attributes.
  name: --use-ad-posix-attributes
  required: false
- alternate: []
  help: When using LDAP POSIX extensions, query using this base DN
  name: --base-dn
  required: false
permalink: /qq-cli-command-guide/ad/ad_join.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq ad_join</code> command.
synopsis: Join an Active Directory Domain
title: qq ad_join
usage: "qq ad_join [-h] -d DOMAIN -u USERNAME [-p PASSWORD] [--domain-netbios DOMAIN_NETBIOS]\
  \ [-o OU] [--disable-search-trusted-domains] [--use-ad-posix-attributes]\n    [--base-dn\
  \ BASE_DN]"
zendesk_source: qq CLI Command Guide

---