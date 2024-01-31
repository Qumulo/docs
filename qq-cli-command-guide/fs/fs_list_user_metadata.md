---
category: fs
command: fs_list_user_metadata
keywords: qq, qq_cli, fs_list_user_metadata
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
  help: 'In Qumulo Core, there are two types of user metadata, generic and S3.

    By default, qq CLI commands manipulate generic metadata.

    When you use the --s3 flag, Qumulo Core makes user metadata visible to the S3
    protocol as object metadata.

    '
  name: --s3
  required: false
- alternate: []
  help: 'Output the response in json.

    Without this option, keys and values will only show the first 50 characters.'
  name: --json
  required: false
- alternate: []
  help: Snapshot ID to read user metadata from
  name: --snapshot
  required: false
- alternate: []
  help: Print binary values as hex
  name: --hex
  required: false
- alternate: []
  help: Print binary values as base64
  name: --base64
  required: false
permalink: /qq-cli-command-guide/fs/fs_list_user_metadata.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_list_user_metadata</code>
  command.
synopsis: Retrieve user metadata of the specified type for a file
title: qq fs_list_user_metadata
usage: qq fs_list_user_metadata [-h] (--path PATH | --id ID) [--s3] [--json] [--snapshot
  SNAPSHOT] [--hex | --base64]
zendesk_source: qq CLI Command Guide

---