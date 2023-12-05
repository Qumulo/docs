---
category: ad
command: ad_reconfigure
keywords: qq, qq_cli, ad_reconfigure
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
permalink: /qq-cli-command-guide/ad/ad_reconfigure.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq ad_reconfigure</code> command.
synopsis: Reconfigure Active Directory POSIX Attributes
title: qq ad_reconfigure
usage: "qq ad_reconfigure [-h] [--enable-search-trusted-domains | --disable-search-trusted-domains]\n\
  \    [--enable-ad-posix-attributes | --disable-ad-posix-attributes] [--base-dn BASE_DN]"

---