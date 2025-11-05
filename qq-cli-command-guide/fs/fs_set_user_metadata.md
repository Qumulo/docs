---
category: fs
command: fs_set_user_metadata
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
- alternate: []
  help: Plaintext metadata value
  name: --value
  required: false
- alternate: []
  help: Hex-encoded metadata value
  name: --hex-value
  required: false
- alternate: []
  help: Base64-encoded metadata value
  name: --base64-value
  required: false
permalink: /qq-cli-command-guide/fs/fs_set_user_metadata.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_set_user_metadata</code>
  command.
synopsis: Set or update a user metadata value for a file by using the specified metadata
  key and value
title: qq fs_set_user_metadata
usage: qq fs_set_user_metadata [-h] (--path PATH | --id ID) [--s3] --key KEY (--value
  VALUE | --hex-value HEX_VALUE | --base64-value BASE64_VALUE)
zendesk_source: qq CLI Command Guide

---