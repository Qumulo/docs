---
category: portal
command: portal_list_spokes
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
permalink: /qq-cli-command-guide/portal/portal_list_spokes.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_list_spokes</code> command.
synopsis: Get the configuration and status for all spoke portals on the current cluster
title: qq portal_list_spokes
usage: qq portal_list_spokes [-h] [-j] [-d]
zendesk_source: qq CLI Command Guide

---