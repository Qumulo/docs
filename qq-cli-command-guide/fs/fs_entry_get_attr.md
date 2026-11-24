---
category: fs
command: fs_entry_get_attr
optional_options:
  - alternate: []
    help: Parent directory path
    name: --path
    required: false
  - alternate: []
    help: Parent directory ID
    name: --id
    required: false
  - alternate: []
    help: Entry to look up
    name: --name
    required: true
  - alternate: []
    help: Snapshot ID to read from
    name: --snapshot
    required: false
permalink: /qq-cli-command-guide/fs/fs_entry_get_attr.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_entry_get_attr</code> command.
synopsis: Get the attributes of a directory entry by name
title: qq fs_entry_get_attr
usage: qq fs_entry_get_attr [-h] (--path PATH | --id ID) --name NAME [--snapshot SNAPSHOT]
---