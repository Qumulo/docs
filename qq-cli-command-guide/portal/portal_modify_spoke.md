---
category: portal
command: portal_modify_spoke
optional_options:
- alternate:
  - --id
  help: Spoke portal ID
  name: -i
  required: true
- alternate:
  - --hub-address
  help: The IP address of a node in the remote cluster
  name: -a
  required: true
- alternate:
  - --hub-port
  help: The TCP port for portal activity on the remote cluster (3713 by default)
  name: -p
  required: false
- alternate:
  - --json
  help: Pretty-print JSON
  name: -j
  required: false
permalink: /qq-cli-command-guide/portal/portal_modify_spoke.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_modify_spoke</code>
  command.
synopsis: Change the configuration for a spoke portal
title: qq portal_modify_spoke
usage: qq portal_modify_spoke [-h] -i ID -a HUB_ADDRESS [-p HUB_PORT] [-j]
zendesk_source: qq CLI Command Guide

---