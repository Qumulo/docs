---
category: nfs
command: nfs_get_export
keywords: qq, qq_cli, nfs_get_export
optional_options:
- alternate: []
  help: ID of export to modify
  name: --export-id
  required: false
- alternate: []
  help: Path of export to modify
  name: --export-path
  required: false
- alternate: []
  help: ID of the tenant to get the export from. Only used if using the --export-path
    argument.
  name: --tenant-id
  required: false
- alternate: []
  help: Print raw response JSON.
  name: --json
  required: false
permalink: /qq-cli-command-guide/nfs/nfs_get_export.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq nfs_get_export</code> command.
synopsis: Get an export
title: qq nfs_get_export
usage: "qq nfs_get_export [-h] (--export-id EXPORT_ID | --export-path EXPORT_PATH)\
  \ [--tenant-id TENANT_ID]\n    [--json]"

---