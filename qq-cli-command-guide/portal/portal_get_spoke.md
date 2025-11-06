---
category: portal
command: portal_get_spoke
optional_options:
- alternate:
  - --id
  help: Spoke portal ID
  name: -i
  required: true
- alternate:
  - --json
  help: Pretty-print JSON
  name: -j
  required: false
- alternate:
  - --no-paths
  help: Do not attempt to resolve file IDs present on the local cluster to paths.
  name: -n
  required: false
- alternate:
  - --dns-lookup
  help: Attempt reverse DNS lookups for peer IP addresses
  name: -d
  required: false
permalink: /qq-cli-command-guide/portal/portal_get_spoke.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_get_spoke</code> command.
synopsis: Get the configuration and status for a spoke portal on the current cluster
title: qq portal_get_spoke
usage: qq portal_get_spoke [-h] -i ID [-j] [-n] [-d]
zendesk_source: qq CLI Command Guide

---