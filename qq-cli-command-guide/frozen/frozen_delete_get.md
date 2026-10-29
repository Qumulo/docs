---
category: frozen
command: frozen_delete_get
optional_options:
- alternate: []
  help: The delete's ID, as frozen_delete or frozen_delete_list prints it.
  name: --id
  required: true
- alternate: []
  help: 'Cluster path of the Frozen bridge, or of any file or directory on it. (Default:
    the cluster''s only Frozen bridge, when it has exactly one)'
  name: --bridge-path
  required: false
permalink: /qq-cli-command-guide/frozen/frozen_delete_get.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq frozen_delete_get</code> command.
synopsis: 'Show a delete: what it covers, its state, and how many files and bytes
  it has deleted. A failed delete''s failure_message says what to do.'
title: qq frozen_delete_get
usage: qq frozen_delete_get [-h] --id ID [--bridge-path BRIDGE_PATH]
zendesk_source: qq CLI Command Guide

---