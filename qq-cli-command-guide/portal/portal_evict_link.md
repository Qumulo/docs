---
category: portal
command: portal_evict_link
optional_options:
- alternate:
  - --spoke-id
  help: The identifier of the spoke portal from which to remove the cached link
  name: -i
  required: true
- alternate: []
  help: The identifier of the parent directory from which to remove the cached link
  name: --dir-id
  required: true
- alternate: []
  help: The name of the cached child file or directory to unlink
  name: --name
  required: true
permalink: /qq-cli-command-guide/portal/portal_evict_link.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_evict_link</code> command.
synopsis: Remove a cached link from a directory to a child file or directory
title: qq portal_evict_link
usage: qq portal_evict_link [-h] -i SPOKE_ID --dir-id DIR_ID --name NAME
zendesk_source: qq CLI Command Guide

---