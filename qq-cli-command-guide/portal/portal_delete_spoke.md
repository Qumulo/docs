---
category: portal
command: portal_delete_spoke
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
  help: 'Force the deletion of the spoke portal. Caution: This operation deletes all
    data from the spoke portal, including any new and modified data on the spoke that
    has not yet synchronized with the hub portal. Data under the hub portal root directory
    is not affected.'
  name: --force
  required: false
permalink: /qq-cli-command-guide/portal/portal_delete_spoke.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_delete_spoke</code>
  command.
synopsis: Delete a spoke portal on the current cluster
title: qq portal_delete_spoke
usage: qq portal_delete_spoke [-h] -i ID [-j] [-n] [--force]
zendesk_source: qq CLI Command Guide

---