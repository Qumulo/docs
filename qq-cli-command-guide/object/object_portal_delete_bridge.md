---
category: object
command: object_portal_delete_bridge
optional_options:
- alternate: []
  help: The filesystem UUID of the bridge to delete.
  name: --filesystem-uuid
  required: true
- alternate: []
  help: 'Delete a Frozen bridge even if it holds files or runs a job. This can''t
    be undone: it loses every file not yet frozen, and the owners, permissions and
    other attributes of the frozen files. It also deletes a Frozen bridge while the
    cluster is still deleting files deleted from it or their objects, and leaves those
    files'' objects in the container.'
  name: --force
  required: false
permalink: /qq-cli-command-guide/object/object_portal_delete_bridge.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq object_portal_delete_bridge</code>
  command.
synopsis: Delete a bridge and everything the cluster stored for it. Changes not yet
  written to the bucket are lost, and the bucket is left as it is. File access across
  the cluster pauses briefly while the cluster restarts its services.
title: qq object_portal_delete_bridge
usage: qq object_portal_delete_bridge [-h] --filesystem-uuid FILESYSTEM_UUID [--force]
zendesk_source: qq CLI Command Guide

---