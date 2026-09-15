---
category: fs
command: fs_file_modify_lock
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
  help: Set a legal hold on the file.
  name: --enable-legal-hold
  required: false
- alternate: []
  help: Unset a legal hold on the file.
  name: --disable-legal-hold
  required: false
- alternate: []
  help: Set the retention period for a file lock.
  name: --retention-period
  required: false
- alternate: []
  help: Set the retention period for a file lock to the specified number of days from
    now.
  name: --retention-days
  required: false
- alternate: []
  help: Set the retention period for a file lock to the specified number of years
    from now.
  name: --retention-years
  required: false
permalink: /qq-cli-command-guide/fs/fs_file_modify_lock.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq fs_file_modify_lock</code>
  command.
synopsis: Modify a retention period or legal hold on a file.
title: qq fs_file_modify_lock
usage: qq fs_file_modify_lock [-h] (--path PATH | --id ID) [--enable-legal-hold |
  --disable-legal-hold] [--retention-period RETENTION_PERIOD | --retention-days RETENTION_DAYS
  | --retention-years RETENTION_YEARS]
zendesk_source: qq CLI Command Guide

---
For more information, see {{site.xref.adminOnPrem.fileLock}}.

## Examples
{% include note.html content="The following operations require Write ACL permissions for the file and a role with the `FS_FILE_LOCK_WRITE` role-based access control (RBAC) privilege." %}

### To Enable Locking for a File
Run the `fs_file_modify_lock` command, specify the path to the file, and use the `--enable-legal-hold` flag. For example:

```bash
qq fs_file_modify_lock \
  --path /path-to/my-file \
  --enable-legal-hold
```

### To Disable Locking for a File
Run the `fs_file_modify_lock` command, specify the path to the file, and use the `--disable-legal hold` flag. For example:

```bash
qq fs_file_modify_lock \
  --path /path-to/my-file \
  --disable-legal-hold
```

### To Set a Retention Period for a File
Run the `fs_file_modify_lock` command, specify the path to the file, and then specify a timestamp in the ISO 8601 UTC format followed by `Z`. For example:

```bash
qq fs_file_modify_lock \
  --path /path-to/my-file \
  --retention-period 2024-08-14T23:37:48Z
```

Alternatively, you can set the retention period in years or days. For example:

```bash
qq fs_file_modify_lock \
  --path /path-to/my-file \
  --days 3
```
