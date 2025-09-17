---
category: portal
command: portal_accept_hub
optional_options:
- alternate:
  - --id
  help: Hub portal ID
  name: -i
  required: true
- alternate:
  - --spoke-address
  help: The IP address of a node in the remote cluster
  name: -a
  required: true
- alternate:
  - --spoke-port
  help: The TCP port for portal activity on the remote cluster (3713 by default)
  name: -p
  required: false
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
permalink: /qq-cli-command-guide/portal/portal_accept_hub.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_accept_hub</code> command.
synopsis: Accept the specified pending hub portal. Accepting a hub portal establishes
  a relationship with a spoke portal but does not provide data access automatically.
title: qq portal_accept_hub
usage: qq portal_accept_hub [-h] -i ID -a SPOKE_ADDRESS [-p SPOKE_PORT] [-j] [-n]
zendesk_source: qq CLI Command Guide

---