---
category: fs
command: fs_rename
keywords: qq, qq_cli, fs_rename
optional_options:
- alternate: []
  help: Destination parent directory path
  name: --path
  required: false
- alternate: []
  help: Destination parent directory ID
  name: --id
  required: false
- alternate: []
  help: Source file path
  name: --source
  required: true
- alternate: []
  help: New name in destination directory
  name: --name
  required: true
- alternate: []
  help: Clobber destination if exists
  name: --clobber
  required: false
permalink: /qq-cli-command-guide/fs/fs_rename.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_rename</code> command.
synopsis: Rename a file system object
title: qq fs_rename
usage: qq fs_rename [-h] (--path PATH | --id ID) --source SOURCE --name NAME [--clobber]
zendesk_source: qq CLI Command Guide

---