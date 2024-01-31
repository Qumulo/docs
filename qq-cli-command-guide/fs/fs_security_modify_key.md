---
category: fs
command: fs_security_modify_key
keywords: qq, qq_cli, fs_security_modify_key
optional_options:
- alternate:
  - --key
  help: The identifier or name of the key to modify.
  name: -k
  required: true
- alternate: []
  help: The new name for the specified key.
  name: --new-name
  required: false
- alternate: []
  help: The comment for the specified key.
  name: --comment
  required: false
- alternate: []
  help: "\n                Enable the specified key. You can use an enabled key to\
    \ lock snapshots.\n                You can also associate an enabled key with\
    \ policies that take snapshots. Note: The\n                system enables keys\
    \ upon creation.\n                "
  name: --enable
  required: false
- alternate: []
  help: "\n                Disable the specified key. You cannot use a disabled key\
    \ to lock new snapshots.\n                Existing snapshots which use the disabled\
    \ key remain locked. However, you can still\n                use a disabled key\
    \ to unlock the snapshots that it locked. Important: You cannot\n            \
    \    disable a key if any snapshot policy uses it.\n                "
  name: --disable
  required: false
- alternate: []
  help: Print the output in JSON format. By default, the output is in a table.
  name: --json
  required: false
permalink: /qq-cli-command-guide/fs/fs_security_modify_key.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_security_modify_key</code>
  command.
synopsis: 'Modify the name or comment of a key in the file system key store.

  Enable or disable a key.

  '
title: qq fs_security_modify_key
usage: qq fs_security_modify_key [-h] -k KEY [--new-name NEW_NAME] [--comment COMMENT]
  [--enable | --disable] [--json]
zendesk_source: qq CLI Command Guide

---