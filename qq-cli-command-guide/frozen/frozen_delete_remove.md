---
category: frozen
command: frozen_delete_remove
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
permalink: /qq-cli-command-guide/frozen/frozen_delete_remove.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq frozen_delete_remove</code>
  command.
synopsis: Remove a delete that is FINISHED, CANCELED or FAILED, so it is no longer
  listed. Removing it changes no files. A delete in progress is refused; cancel it
  first. A delete canceled or failed moments ago can be refused until the cluster
  has ended it; retry shortly.
title: qq frozen_delete_remove
usage: qq frozen_delete_remove [-h] --id ID [--bridge-path BRIDGE_PATH]
zendesk_source: qq CLI Command Guide

---