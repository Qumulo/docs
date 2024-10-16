---
category: portal
command: portal_propose_hub
optional_options:
- alternate: []
  help: The identifier of the spoke portal from which to propose a relationship
  name: --spoke-id
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
- alternate: []
  help: Full path to the prospective directory that will serve as the hub portal root
    directory
  name: --hub-root
  required: true
- alternate:
  - --json
  help: Pretty-print JSON
  name: -j
  required: false
permalink: /qq-cli-command-guide/portal/portal_propose_hub.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_propose_hub</code> command.
synopsis: Propose a relationship from a spoke portal to a hub portal
title: qq portal_propose_hub
usage: qq portal_propose_hub [-h] --spoke-id SPOKE_ID -a HUB_ADDRESS [-p HUB_PORT]
  --hub-root HUB_ROOT [-j]
zendesk_source: qq CLI Command Guide

---