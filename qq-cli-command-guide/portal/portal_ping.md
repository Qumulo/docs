---
category: portal
command: portal_ping
optional_options:
- alternate:
  - --json
  help: Pretty-print JSON
  name: -j
  required: false
- alternate:
  - --hosts
  help: The IP addresses and TCP ports of the remote cluster. Use a comma-delimited
    list to specify multiple hosts. Use colon as a separator after each IP address
    to provide custom TCP port (3713 is used by default). Ports specified this way
    override other --port arguments.
  name: -m
  required: false
- alternate: []
  help: Ping all hub hosts defined in a local spoke portal
  name: --spoke-id
  required: false
- alternate: []
  help: Ping all spoke hosts defined in a local hub portal
  name: --hub-id
  required: false
- alternate:
  - --portal-port
  help: The TCP port for portal activity on the remote cluster. The default port 3713
    is used if this field is not provided.
  name: -p
  required: false
permalink: /qq-cli-command-guide/portal/portal_ping.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_ping</code> command.
synopsis: Test connectivity from all local nodes to the specified remote hosts
title: qq portal_ping
usage: qq portal_ping [-h] [-j] (-m HOSTS | --spoke-id SPOKE_ID | --hub-id HUB_ID)
  [-p PORTAL_PORT]
zendesk_source: qq CLI Command Guide

---