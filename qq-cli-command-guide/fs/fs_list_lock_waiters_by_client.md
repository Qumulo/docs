---
category: fs
command: fs_list_lock_waiters_by_client
keywords: qq, qq_cli, fs_list_lock_waiters_by_client
optional_options:
- alternate: []
  help: The protocol whose lock waiters should be listed
  name: --protocol
  required: true
- alternate: []
  help: The type of lock whose waiters should be listed
  name: --lock-type
  required: true
- alternate: []
  help: Client hostname
  name: --name
  required: false
- alternate: []
  help: Client IP address
  name: --address
  required: false
permalink: /qq-cli-command-guide/fs/fs_list_lock_waiters_by_client.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_list_lock_waiters_by_client</code>
  command.
synopsis: List waiting lock requests for a particular client machine
title: qq fs_list_lock_waiters_by_client
usage: qq fs_list_lock_waiters_by_client [-h] --protocol {nlm} --lock-type {byte-range}
  [--name NAME] [--address ADDRESS]
zendesk_source: qq CLI Command Guide

---