---
category: nfs
command: nfs_mod_export_host_access
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
  help: ID of the tenant the export is in. Only used if using the --export-path argument
  name: --tenant-id
  required: false
- alternate: []
  help: Print raw response JSON
  name: --json
  required: false
permalink: /qq-cli-command-guide/nfs/nfs_mod_export_host_access.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq nfs_mod_export_host_access</code>
  command.
synopsis: Modify the access hosts are granted to an export
title: qq nfs_mod_export_host_access
usage: qq nfs_mod_export_host_access [-h] (--export-id EXPORT_ID | --export-path EXPORT_PATH)
  [--tenant-id TENANT_ID] [--json] {add_entry,modify_entry,remove_entry} ...
zendesk_source: qq CLI Command Guide

---