---
category: portal
command: portal_delete_hub
optional_options:
- alternate:
  - --id
  help: Hub portal ID
  name: -i
  required: true
- alternate: []
  help: 'Force the deletion of the hub portal. Caution: This operation deletes all
    data from the spoke portal, including any new and modified data on the spoke that
    has not yet synchronized with the hub portal. Data under the hub portal root directory
    is not affected.'
  name: --force
  required: false
permalink: /qq-cli-command-guide/portal/portal_delete_hub.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq portal_delete_hub</code> command.
synopsis: Delete a hub portal
title: qq portal_delete_hub
usage: qq portal_delete_hub [-h] -i ID [--force]
zendesk_source: qq CLI Command Guide

---