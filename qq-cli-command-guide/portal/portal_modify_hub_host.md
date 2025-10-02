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
- alternate:
  - --spoke-hosts
  help: The IP addresses and TCP ports of the remote cluster. Use a comma-delimited
    list to specify multiple hosts. Use colon as a separator after each IP address
    to provide custom TCP port (3713 is used by default).
  name: -m
  required: false
- alternate:
  - --spoke-address
  help: The IP address of a node in the remote cluster
  name: -a
  required: false
- alternate:
  - --spoke-port
  help: The TCP port for portal activity on the remote cluster. The default port 3713
    is used if this field is not provided.
  name: -p
  required: false
permalink: /qq-cli-command-guide/portal/portal_modify_hub_host.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_modify_hub_host</code>
  command.
synopsis: Modify the remote spoke address and port for a hub portal
title: qq portal_modify_hub_host
usage: qq portal_modify_hub_host [-h] -i ID [-j] [-n] (-m SPOKE_HOSTS | -a SPOKE_ADDRESS)
  [-p SPOKE_PORT]
zendesk_source: qq CLI Command Guide

---