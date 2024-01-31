---
category: fs
command: fs_release_nlm_locks_by_client
keywords: qq, qq_cli, fs_release_nlm_locks_by_client
optional_options:
- alternate: []
  help: This command can cause corruption, add this flag to release lock
  name: --force
  required: false
- alternate: []
  help: Client hostname
  name: --name
  required: false
- alternate: []
  help: Client IP address
  name: --address
  required: false
permalink: /qq-cli-command-guide/fs/fs_release_nlm_locks_by_client.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_release_nlm_locks_by_client</code>
  command.
synopsis: "Release NLM byte range locks held by client. This method\n    releases\
  \ all locks held by a particular client. This is dangerous, and\n    should only\
  \ be used after confirming that the client is dead."
title: qq fs_release_nlm_locks_by_client
usage: qq fs_release_nlm_locks_by_client [-h] [--force] [--name NAME] [--address ADDRESS]
zendesk_source: qq CLI Command Guide

---