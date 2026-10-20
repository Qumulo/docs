---
category: frozen
command: frozen_bridge_create
optional_options:
- alternate: []
  help: Cluster path of the bridge's directory, which the command creates. Its parent
    must exist, and must not be inside another bridge.
  name: --path
  required: true
- alternate: []
  help: 'Let clients change the metadata of a file that is frozen, offline or restoring:
    its mode, owner, group, ACL, times and DOS attributes, and its named streams.
    This can''t be changed after creation. (Default: such changes are refused)'
  name: --allow-archived-metadata-changes
  required: false
permalink: /qq-cli-command-guide/frozen/frozen_bridge_create.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq frozen_bridge_create</code>
  command.
synopsis: Create a Frozen bridge, a directory whose files freeze jobs can move to
  the Azure Archive tier, over Azure storage Qumulo has set aside for the cluster.
title: qq frozen_bridge_create
usage: qq frozen_bridge_create [-h] --path PATH [--allow-archived-metadata-changes]
zendesk_source: qq CLI Command Guide

---