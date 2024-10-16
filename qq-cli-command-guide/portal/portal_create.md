---
category: portal
command: portal_create
optional_options:
- alternate: []
  help: The full path to the directory that serves as the spoke portal root directory.
    Qumulo Core creates this directory for you automatically. If this directory exists
    already, the system outputs an error.
  name: --spoke-root
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
permalink: /qq-cli-command-guide/portal/portal_create.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_create</code> command.
synopsis: Create a spoke portal and propose a hub portal relationship on another cluster
title: qq portal_create
usage: qq portal_create [-h] --spoke-root SPOKE_ROOT -a HUB_ADDRESS [-p HUB_PORT]
  --hub-root HUB_ROOT [-j]
zendesk_source: qq CLI Command Guide

---