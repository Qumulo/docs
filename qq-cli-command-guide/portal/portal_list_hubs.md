---
category: portal
command: portal_list_hubs
optional_options:
- alternate:
  - --json
  help: Pretty-print JSON
  name: -j
  required: false
- alternate:
  - --dns-lookup
  help: Resolve peer IP addresses to names. The local cluster performs the lookup,
    so the names come from its DNS configuration and the caller needs the PRIVILEGE_DNS_USE
    privilege.
  name: -d
  required: false
permalink: /qq-cli-command-guide/portal/portal_list_hubs.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_list_hubs</code> command.
synopsis: Get the configuration and status for all hub portals on the current cluster
title: qq portal_list_hubs
usage: qq portal_list_hubs [-h] [-j] [-d]
zendesk_source: qq CLI Command Guide

---