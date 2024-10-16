---
category: portal
command: portal_authorize_hub
optional_options:
- alternate:
  - --id
  help: The identifier of the hub portal to authorize
  name: -i
  required: true
- alternate:
  - --spoke-address
  help: The IP address of a node in the spoke portal host cluster that proposed the
    relationship
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
permalink: /qq-cli-command-guide/portal/portal_authorize_hub.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_authorize_hub</code>
  command.
synopsis: Authorize the specified hub portal to activate the relationship
title: qq portal_authorize_hub
usage: qq portal_authorize_hub [-h] -i ID -a SPOKE_ADDRESS [-p SPOKE_PORT] [-j]
zendesk_source: qq CLI Command Guide

---