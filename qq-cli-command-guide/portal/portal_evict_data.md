---
category: portal
command: portal_evict_data
optional_options:
- alternate:
  - --spoke-id
  help: The identifier of the spoke portal from which to remove the cached file
  name: -i
  required: true
- alternate: []
  help: The identifier of the file to be removed from the spoke portal cache
  name: --file-id
  required: true
permalink: /qq-cli-command-guide/portal/portal_evict_data.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_evict_data</code> command.
synopsis: Free the capacity consumed by a cached file in the specified spoke portal
title: qq portal_evict_data
usage: qq portal_evict_data [-h] -i SPOKE_ID --file-id FILE_ID
zendesk_source: qq CLI Command Guide

---