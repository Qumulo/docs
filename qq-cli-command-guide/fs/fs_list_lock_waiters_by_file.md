---
category: fs
command: fs_list_lock_waiters_by_file
optional_options:
- alternate: []
  help: File path
  name: --path
  required: false
- alternate: []
  help: File ID
  name: --id
  required: false
- alternate: []
  help: The protocol whose lock waiters should be listed
  name: --protocol
  required: true
- alternate: []
  help: The type of lock whose waiters should be listed
  name: --lock-type
  required: true
- alternate: []
  help: Snapshot id of the specified file.
  name: --snapshot
  required: false
permalink: /qq-cli-command-guide/fs/fs_list_lock_waiters_by_file.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_list_lock_waiters_by_file</code>
  command.
synopsis: List waiting lock requests for a particular file
title: qq fs_list_lock_waiters_by_file
usage: qq fs_list_lock_waiters_by_file [-h] (--path PATH | --id ID) --protocol {nlm}
  --lock-type {byte-range} [--snapshot SNAPSHOT]
zendesk_source: qq CLI Command Guide

---