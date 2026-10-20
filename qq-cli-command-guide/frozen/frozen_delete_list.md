---
category: frozen
command: frozen_delete_list
optional_options:
- alternate: []
  help: 'Cluster path of the Frozen bridge, or of any file or directory on it. (Default:
    the cluster''s only Frozen bridge, when it has exactly one)'
  name: --bridge-path
  required: false
- alternate: []
  help: 'Only list deletes in this state. (Default: every state)'
  name: --state
  required: false
- alternate:
  - --json
  help: Pretty-print JSON
  name: -j
  required: false
permalink: /qq-cli-command-guide/frozen/frozen_delete_list.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq frozen_delete_list</code> command.
synopsis: List a Frozen bridge's deletes, whether in progress or ended, until they
  are removed.
title: qq frozen_delete_list
usage: qq frozen_delete_list [-h] [--bridge-path BRIDGE_PATH] [--state {IN_PROGRESS,FINISHED,CANCELED,FAILED}]
  [-j]
zendesk_source: qq CLI Command Guide

---