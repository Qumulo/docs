---
category: fs
command: fs_file_set_lock
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
  help: Set or unset a legal hold on the file.
  name: --legal-hold
  required: false
- alternate: []
  help: Set the retention period for a file lock.
  name: --retention-period
  required: false
- alternate: []
  help: Set the retention period for a file lock to the specified number of days from
    now.
  name: --days
  required: false
- alternate: []
  help: Set the retention period for a file lock to the specified number of years
    from now.
  name: --years
  required: false
permalink: /qq-cli-command-guide/fs/fs_file_set_lock.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_file_set_lock</code> command.
synopsis: Set a retention period or legal hold on a file.
title: qq fs_file_set_lock
usage: qq fs_file_set_lock [-h] (--path PATH | --id ID) [--legal-hold BOOL] [--retention-period
  RETENTION_PERIOD | --days DAYS | --years YEARS]
zendesk_source: qq CLI Command Guide

---