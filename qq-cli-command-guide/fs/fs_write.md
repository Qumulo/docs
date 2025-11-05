---
category: fs
command: fs_write
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
  help: Stream ID
  name: --stream-id
  required: false
- alternate: []
  help: Stream name
  name: --stream-name
  required: false
- alternate: []
  help: Create file before writing. Fails if exists or is used with stream identifiers.
  name: --create
  required: false
- alternate: []
  help: Offset at which to write data. If not specified, the existing contents of
    the file will be replaced with the given contents.
  name: --offset
  required: false
- alternate: []
  help: File data to send
  name: --file
  required: false
- alternate: []
  help: Write file from stdin
  name: --stdin
  required: false
permalink: /qq-cli-command-guide/fs/fs_write.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_write</code> command.
synopsis: Write data to an object
title: qq fs_write
usage: qq fs_write [-h] (--path PATH | --id ID) [--stream-id STREAM_ID | --stream-name
  STREAM_NAME | --create] [--offset OFFSET] [--file FILE] [--stdin]
zendesk_source: qq CLI Command Guide

---

## Examples

### To Write a File to a Directory on a Qumulo Cluster
Run the `qq fs_write` command, use the `--create` flag and specify the source of and target locations for the file. For example:

```bash
qq fs_write --create \
  --file /upgrade/qinstall.qimg \
  --path /qinstall.qimg
```

{{site.exampleOutput}}

```json
{
  "blocks": "139355",
  "change_time": "2024-02-04T00:28:50.778788345Z",
  "child_count": 0,
  "creation_time": "2024-02-04T00:28:50.766408341Z",
  "file_number": "6981",
  "group": "2",
  "id": "6981",
  "mode": "0644",
  "modification_time": "2024-02-04T00:29:32.967968707Z",
  "name": "",
  "num_links": 1,
  "owner": "500",
  "path": "/qinstall.qimg",
  "size": "570798080",
  "type": "FS_FILE_TYPE_FILE"
}
```
