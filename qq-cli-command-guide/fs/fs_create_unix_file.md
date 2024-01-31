---
category: fs
command: fs_create_unix_file
keywords: qq, qq_cli, fs_create_unix_file
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
  help: Major and minor numbers
  name: --major-minor-numbers
  required: false
- alternate: []
  help: New file name
  name: --name
  required: true
- alternate: []
  help: type of UNIX file to create
  name: --type
  required: true
permalink: /qq-cli-command-guide/fs/fs_create_unix_file.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_create_unix_file</code>
  command.
synopsis: Create a new pipe, character device, block device or socket
title: qq fs_create_unix_file
usage: qq fs_create_unix_file [-h] (--path PATH | --id ID) [--major-minor-numbers
  MAJOR_MINOR_NUMBERS] --name NAME --type TYPE
zendesk_source: qq CLI Command Guide

---