---
category: fs
command: fs_delete_user_metadata
keywords: qq, qq_cli, fs_delete_user_metadata
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
  help: Metadata key
  name: --key
  required: true
permalink: /qq-cli-command-guide/fs/fs_delete_user_metadata.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_delete_user_metadata</code>
  command.
synopsis: Delete the user metadata for a file by using the specified metadata key
title: qq fs_delete_user_metadata
usage: qq fs_delete_user_metadata [-h] (--path PATH | --id ID) [--s3] --key KEY

---