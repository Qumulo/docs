---
category: frozen
command: frozen_delete_cancel
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
permalink: /qq-cli-command-guide/frozen/frozen_delete_cancel.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq frozen_delete_cancel</code>
  command.
synopsis: Cancel a delete, which is CANCELED at once, and print it. What it already
  deleted stays deleted, and it deletes nothing more.
title: qq frozen_delete_cancel
usage: qq frozen_delete_cancel [-h] --id ID [--bridge-path BRIDGE_PATH]
zendesk_source: qq CLI Command Guide

---