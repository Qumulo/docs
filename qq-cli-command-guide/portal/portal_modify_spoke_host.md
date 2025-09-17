---
category: portal
command: portal_modify_spoke_host
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
- alternate: []
  help: The IP address of a node in the remote cluster
  name: --hub-address
  required: true
- alternate: []
  help: The TCP port for portal activity on the remote cluster (3713 by default)
  name: --hub-port
  required: true
permalink: /qq-cli-command-guide/portal/portal_modify_spoke_host.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_modify_spoke_host</code>
  command.
synopsis: Modify the remote hub address and port for a spoke portal
title: qq portal_modify_spoke_host
usage: qq portal_modify_spoke_host [-h] -i ID [-j] [-n] --hub-address HUB_ADDRESS
  --hub-port HUB_PORT
zendesk_source: qq CLI Command Guide

---