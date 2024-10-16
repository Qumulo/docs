---
category: portal
command: portal_evict_tree
optional_options:
- alternate:
  - --spoke-id
  help: The identifier of the spoke portal from which to remove the cached directory
  name: -i
  required: true
- alternate: []
  help: The identifier of the cached directory to remove
  name: --dir-id
  required: true
permalink: /qq-cli-command-guide/portal/portal_evict_tree.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_evict_tree</code> command.
synopsis: Remove a cached directory from a spoke portal
title: qq portal_evict_tree
usage: qq portal_evict_tree [-h] -i SPOKE_ID --dir-id DIR_ID
zendesk_source: qq CLI Command Guide

---