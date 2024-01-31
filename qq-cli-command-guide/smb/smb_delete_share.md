---
category: smb
command: smb_delete_share
keywords: qq, qq_cli, smb_delete_share
optional_options:
- alternate: []
  help: ID of share to delete.
  name: --id
  required: false
- alternate: []
  help: Name of share to delete.
  name: --name
  required: false
- alternate: []
  help: "\n                The ID of the tenant from which to delete the share. Use\
    \ this flag only if you also\n                use the --name flag.\n         \
    \       "
  name: --tenant-id
  required: false
permalink: /qq-cli-command-guide/smb/smb_delete_share.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq smb_delete_share</code> command.
synopsis: Delete a share
title: qq smb_delete_share
usage: qq smb_delete_share [-h] (--id ID | --name NAME) [--tenant-id TENANT_ID]
zendesk_source: qq CLI Command Guide

---