---
category: portal
command: portal_deny_hub_root
optional_options:
- alternate:
  - --id
  help: Hub portal ID
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
  help: File ID of the hub root directory
  name: --hub-root-id
  required: false
- alternate: []
  help: Path of the hub root directory
  name: --hub-root-path
  required: false
permalink: /qq-cli-command-guide/portal/portal_deny_hub_root.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_deny_hub_root</code>
  command.
synopsis: Deny access to the specified hub root directory for the specified hub portal.
  This action does not affect the data in the hub root directory.
title: qq portal_deny_hub_root
usage: qq portal_deny_hub_root [-h] -i ID [-j] [-n] (--hub-root-id HUB_ROOT_ID | --hub-root-path
  HUB_ROOT_PATH)
zendesk_source: qq CLI Command Guide

---