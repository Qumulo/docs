---
category: portal
command: portal_delete_spoke_root
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
  help: File ID of the spoke root directory
  name: --spoke-root-id
  required: false
- alternate: []
  help: Path of the spoke root directory
  name: --spoke-root-path
  required: false
permalink: /qq-cli-command-guide/portal/portal_delete_spoke_root.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_delete_spoke_root</code>
  command.
synopsis: Delete the specified spoke root directory for the specified spoke portal.
  This action does not affect the data in the hub root directory.
title: qq portal_delete_spoke_root
usage: qq portal_delete_spoke_root [-h] -i ID [-j] [-n] (--spoke-root-id SPOKE_ROOT_ID
  | --spoke-root-path SPOKE_ROOT_PATH)
zendesk_source: qq CLI Command Guide

---