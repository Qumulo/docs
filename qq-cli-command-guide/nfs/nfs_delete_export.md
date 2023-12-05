---
category: nfs
command: nfs_delete_export
keywords: qq, qq_cli, nfs_delete_export
optional_options:
- alternate: []
  help: ID of export to delete
  name: --export-id
  required: false
- alternate: []
  help: Path of export to delete
  name: --export-path
  required: false
- alternate: []
  help: ID of the tenant the export is in. Only used if using the --export-path argument.
  name: --tenant-id
  required: false
permalink: /qq-cli-command-guide/nfs/nfs_delete_export.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq nfs_delete_export</code> command.
synopsis: Delete an export
title: qq nfs_delete_export
usage: qq nfs_delete_export [-h] (--export-id EXPORT_ID | --export-path EXPORT_PATH)
  [--tenant-id TENANT_ID]

---