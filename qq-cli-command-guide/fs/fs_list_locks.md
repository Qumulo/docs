---
category: fs
command: fs_list_locks
optional_options:
- alternate: []
  help: The protocol whose locks should be listed
  name: --protocol
  required: true
- alternate: []
  help: The type of lock to list.
  name: --lock-type
  required: true
- alternate: []
  help: File path
  name: --path
  required: false
- alternate: []
  help: File ID
  name: --id
  required: false
- alternate: []
  help: List all locks held by the client with this IP address.
  name: --ip
  required: false
- alternate: []
  help: List all locks held by the client with this hostname. Only available for NLM
    locks.
  name: --hostname
  required: false
- alternate: []
  help: When a file is specified, list locks held on a specific snapshot.
  name: --snapshot
  required: false
- alternate: []
  help: Don't execute additional API calls to obtain file paths and client hostnames
    for results.
  name: --no-resolve
  required: false
- alternate: []
  help: Print a raw JSON response.
  name: --json
  required: false
- alternate: []
  help: Sort results by this attribute.
  name: --sort
  required: false
permalink: /qq-cli-command-guide/fs/fs_list_locks.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_list_locks</code> command.
synopsis: List file locks held by clients.
title: qq fs_list_locks
usage: qq fs_list_locks [-h] --protocol {nlm,nfs4,smb} --lock-type {share-mode,byte-range}
  [--path PATH | --id ID | --ip IP | --hostname HOSTNAME] [--snapshot SNAPSHOT] [--no-resolve]
  [--json] [--sort {file,client}]
zendesk_source: qq CLI Command Guide

---