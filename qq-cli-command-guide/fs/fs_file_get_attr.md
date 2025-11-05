---
category: fs
command: fs_file_get_attr
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
  help: Snapshot ID to read from
  name: --snapshot
  required: false
- alternate: []
  help: Retrieve the file lock for this file. Optional because it requires READ_ACL
  name: --retrieve-file-lock
  required: false
- alternate: []
  help: Stream ID
  name: --stream-id
  required: false
- alternate: []
  help: Stream name
  name: --stream-name
  required: false
permalink: /qq-cli-command-guide/fs/fs_file_get_attr.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_file_get_attr</code> command.
synopsis: Get file attributes
title: qq fs_file_get_attr
usage: qq fs_file_get_attr [-h] (--path PATH | --id ID) [--snapshot SNAPSHOT] [--retrieve-file-lock]
  [--stream-id STREAM_ID | --stream-name STREAM_NAME]
zendesk_source: qq CLI Command Guide

---
For more information, see {{site.xref.adminOnPrem.fileLock}}.

## Examples
{% include note.html content="The following operations require Read ACL permissions for the file." %}

### To Retrieve the Lock Status for a File
Run the `fs_file_get_attr` command, specify the path to the file, and use the `--retrieve-file-lock` flag. For example:

```bash
qq fs_file_get_attr \
  --path /path-to/my-file \
  --retrieve-file-lock
```

{{site.exampleOutput}}

```json
{
  "legal_hold": true,
  "retention_period": "2024-09-15T23:41:40Z"
}
```
