---
category: fs
command: fs_read_dir
optional_options:
- alternate: []
  help: Directory path
  name: --path
  required: false
- alternate: []
  help: Directory ID
  name: --id
  required: false
- alternate: []
  help: REST API pagination size to use. This affects the number of API calls made,
    and the structure of the resulting JSON output, but does not affect what entries
    are returned. Note that the system may impose an upper limit on the page size.
  name: --page-size
  required: false
- alternate: []
  help: Snapshot ID to read from
  name: --snapshot
  required: false
- alternate: []
  help: SMB style match pattern.
  name: --smb-pattern
  required: false
permalink: /qq-cli-command-guide/fs/fs_read_dir.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_read_dir</code> command.
synopsis: Read directory
title: qq fs_read_dir
usage: qq fs_read_dir [-h] (--path PATH | --id ID) [--page-size PAGE_SIZE] [--snapshot
  SNAPSHOT] [--smb-pattern SMB_PATTERN]
zendesk_source: qq CLI Command Guide

---

## Examples

### To List the Contents of a Directory on a Qumulo Cluster
Run the `qq fs_read_dir` command and specify the path whose contents to list. For example:

```bash
qq fs_read_dir --path /accounting
```

{{site.exampleOutput}} In this example, there are 2 files in the `/accounting` directory.

```json
{
  "child_count": 2,
  "files": [{
    "blocks": "0",
    "change_time": "2024-02-04T19:29:48.136708478Z",
    "child_count": 2,
    "creation_time": "2024-02-04T19:29:16.846825314Z",
    "file_number": "4",
    "group": "513",
    "id": "4",
    "mode": "0777",
    "modification_time": "2024-02-04T19:29:48.136708478Z",
    "name": "receipts",
    "num_links": 2,
    "owner": "500",
    "path": "/receipts/",
    "size": "1024",
    "type": "FS_FILE_TYPE_DIRECTORY"
  },{
    "blocks": "0",
    "change_time": "2015-02-04T19:34:17.113793299Z",
    "child_count": 1,
    "creation_time": "2015-02-04T19:24:12.201732558Z",
    "file_number": "3",
    "group": "513",
    "id": "3",
    "mode": "0777",
    "modification_time": "2015-02-04T19:34:17.113793299Z",
    "name": "invoices",
    "num_links": 2,
    "owner": "500",
    "path": "/invoices/",
    "size": "512",
    "type": "FS_FILE_TYPE_DIRECTORY"
  }],
  "id": "2",
  "paging": {
  "next": "",
  "prev": ""
  },
  "path": "/"
}
```
