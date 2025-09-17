---
category: portal
command: portal_propose_spoke_root
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
  help: The full path to the directory that serves as the spoke portal root directory.
    Qumulo Core creates this directory for you automatically. If this directory exists
    already, the system outputs an error.
  name: --spoke-root-path
  required: true
- alternate: []
  help: The full path to the prospective directory that will serve as the hub portal
    root directory
  name: --hub-root-path
  required: true
permalink: /qq-cli-command-guide/portal/portal_propose_spoke_root.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_propose_spoke_root</code>
  command.
synopsis: Propose a spoke root directory for the specified spoke portal. This creates
  a pending hub root directory on the paired remote hub portal.
title: qq portal_propose_spoke_root
usage: qq portal_propose_spoke_root [-h] -i ID [-j] [-n] --spoke-root-path SPOKE_ROOT_PATH
  --hub-root-path HUB_ROOT_PATH
zendesk_source: qq CLI Command Guide

---