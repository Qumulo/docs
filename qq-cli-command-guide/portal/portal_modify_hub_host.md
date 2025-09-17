---
category: portal
command: portal_modify_hub_host
optional_options:
- alternate:
  - --id
  help: Hub portal ID
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
- alternate: []
  help: The IP address of a node in the remote cluster
  name: --spoke-address
  required: true
- alternate: []
  help: The TCP port for portal activity on the remote cluster (3713 by default)
  name: --spoke-port
  required: true
permalink: /qq-cli-command-guide/portal/portal_modify_hub_host.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_modify_hub_host</code>
  command.
synopsis: Modify the remote spoke address and port for a hub portal
title: qq portal_modify_hub_host
usage: qq portal_modify_hub_host [-h] -i ID [-j] [-n] --spoke-address SPOKE_ADDRESS
  --spoke-port SPOKE_PORT
zendesk_source: qq CLI Command Guide

---