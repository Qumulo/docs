---
category: fs
command: fs_get_user_metadata
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
  help: 'Operate on S3 user metadata: the x-amz-meta-* headers of the object,

    keyed by the header name without the x-amz-meta- prefix. Without --s3 or --well-known,

    qq CLI commands manipulate generic metadata, which S3 shows as object tags.

    '
  name: --s3
  required: false
- alternate: []
  help: 'Operate on well-known metadata, a fixed set of keys that Qumulo Core

    defines: the standard S3 object headers Cache-Control, Content-Disposition, Content-Encoding,

    Content-Language, Content-Type, and Expires.

    '
  name: --well-known
  required: false
- alternate: []
  help: Metadata key
  name: --key
  required: true
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
permalink: /qq-cli-command-guide/fs/fs_get_user_metadata.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_get_user_metadata</code>
  command.
synopsis: Retrieve a user metadata value for a file by using the specified metadata
  key
title: qq fs_get_user_metadata
usage: qq fs_get_user_metadata [-h] (--path PATH | --id ID) [--s3 | --well-known]
  --key KEY [--snapshot SNAPSHOT] [--hex | --base64]
zendesk_source: qq CLI Command Guide

---