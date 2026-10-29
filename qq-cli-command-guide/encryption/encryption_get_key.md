---
category: encryption
command: encryption_get_key
optional_options:
- alternate:
  - --key
  help: The identifier or name of the key for which to show information.
  name: -k
  required: true
- alternate: []
  help: Print the output in JSON format. By default, the output is in a table.
  name: --json
  required: false
permalink: /qq-cli-command-guide/encryption/encryption_get_key.html
positional_options: []
redirect_from:
- /qq-cli-command-guide/fs/fs_security_get_key.html
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq encryption_get_key</code> command.
synopsis: Get information for a key in the filesystem key store.
title: qq encryption_get_key
usage: qq encryption_get_key [-h] -k KEY [--json]
zendesk_source: qq CLI Command Guide

---