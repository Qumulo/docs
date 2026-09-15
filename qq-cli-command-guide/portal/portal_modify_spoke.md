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
  - --hub-hosts
  help: The IP addresses and TCP ports of the remote cluster. Use a comma-delimited
    list to specify multiple hosts. Use colon as a separator after each IP address
    to provide custom TCP port (3713 is used by default). Ports specified this way
    override other --port arguments. Put brackets around an IPv6 address, such as
    [2001:db8::1] or [2001:db8::1]:4000. Use a dash to specify a range of IPv4 addresses
    that share their first three octets, such as 10.220.1.70-73 or 10.220.1.70-10.220.1.73.
    A port applies to the whole range.
  name: -m
  required: false
- alternate:
  - --hub-address
  help: The IP address of a node in the remote cluster
  name: -a
  required: false
- alternate:
  - --hub-port
  help: The TCP port for portal activity on the remote cluster. The default port 3713
    is used if this field is not provided.
  name: -p
  required: false
permalink: /qq-cli-command-guide/portal/portal_modify_spoke.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_modify_spoke</code>
  command.
synopsis: Modify the remote hub address and port for a spoke portal
title: qq portal_modify_spoke
usage: qq portal_modify_spoke [-h] -i ID [-j] [-n] (-m HUB_HOSTS | -a HUB_ADDRESS)
  [-p HUB_PORT]
zendesk_source: qq CLI Command Guide

---