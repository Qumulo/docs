---
category: frozen
command: frozen_delete
optional_options:
- alternate: []
  help: Cluster path of one directory, with everything under it, or of one file, on
    a Frozen bridge.
  name: --subtree
  required: false
- alternate: []
  help: Cluster paths of files or directories, each directory with everything under
    it, on one Frozen bridge. Up to 256.
  name: --files
  required: false
- alternate: []
  help: A local file listing the cluster paths --files takes, one to a line. Empty
    lines are skipped.
  name: --files-from
  required: false
- alternate: []
  help: Don't ask first. WARNING! A delete can be canceled with frozen_delete_cancel,
    but what it already deleted can't be recovered.
  name: --force
  required: false
permalink: /qq-cli-command-guide/frozen/frozen_delete.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq frozen_delete</code> command.
synopsis: Start a delete of files and directories on a Frozen bridge, whether their
  data is online or in the Azure Archive tier, and print the delete's ID. File and
  directory permissions aren't checked. A delete removes a directory once everything
  under it is gone, so a file created there while the delete runs is deleted too.
  A delete can't start while a freeze or thaw is working on files under its paths,
  and no freeze or thaw can start over its paths until it ends. A delete can't cover
  the whole bridge, so to delete everything on it, give its top-level files and folders
  to --files or --files-from, up to 256 a delete. Azure charges for data in the Archive
  tier for at least 180 days after it was archived, even when it's deleted sooner.
title: qq frozen_delete
usage: qq frozen_delete [-h] (--subtree SUBTREE | --files FILES [FILES ...] | --files-from
  FILE) [--force]
zendesk_source: qq CLI Command Guide

---