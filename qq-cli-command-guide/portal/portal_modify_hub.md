---
category: portal
command: portal_modify_hub
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
permalink: /qq-cli-command-guide/portal/portal_modify_hub.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_modify_hub</code> command.
synopsis: Change the configuration for a hub portal
title: qq portal_modify_hub
usage: qq portal_modify_hub [-h] -i ID -a SPOKE_ADDRESS [-p SPOKE_PORT] [-j]
zendesk_source: qq CLI Command Guide

---