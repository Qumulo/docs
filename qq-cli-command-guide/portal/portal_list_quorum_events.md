---
category: portal
command: portal_list_quorum_events
optional_options:
- alternate: []
  help: Inclusive lower bound on event time, in RFC 3339 format or epoch seconds.
    If not specified, all available history is returned
  name: --begin-time
  required: false
- alternate: []
  help: Exclusive upper bound on event time; defaults to the current system time
  name: --end-time
  required: false
- alternate: []
  help: Only return events of this kind
  name: --type
  required: false
- alternate: []
  help: Only return events recorded by this node
  name: --node-id
  required: false
- alternate: []
  help: Only return events for the filesystem with this UUID
  name: --filesystem-uuid
  required: false
- alternate: []
  help: Maximum entries returned, oldest first (default 1000)
  name: --limit
  required: false
permalink: /qq-cli-command-guide/portal/portal_list_quorum_events.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_list_quorum_events</code>
  command.
synopsis: List recent portal quorum success and abandon events recorded by the nodes
  of this cluster
title: qq portal_list_quorum_events
usage: qq portal_list_quorum_events [-h] [--begin-time BEGIN_TIME] [--end-time END_TIME]
  [--type {success,abandon}] [--node-id NODE_ID] [--filesystem-uuid FILESYSTEM_UUID]
  [--limit LIMIT]
zendesk_source: qq CLI Command Guide

---