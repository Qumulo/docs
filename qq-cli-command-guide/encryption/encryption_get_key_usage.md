---
category: encryption
command: encryption_get_key_usage
optional_options:
- alternate:
  - --key
  help: The key identifier or name for which to show usage information.
  name: -k
  required: true
- alternate: []
  help: Print the output in JSON format. By default, the output is in a table.
  name: --json
  required: false
permalink: /qq-cli-command-guide/encryption/encryption_get_key_usage.html
positional_options: []
redirect_from:
- /qq-cli-command-guide/fs/fs_security_get_key_usage.html
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq encryption_get_key_usage</code>
  command.
synopsis: Show information about snapshot and snapshot policy usage for a key from
  the filesystem key store.
title: qq encryption_get_key_usage
usage: qq encryption_get_key_usage [-h] -k KEY [--json]
zendesk_source: qq CLI Command Guide

---