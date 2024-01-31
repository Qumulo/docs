---
category: smb
command: smb_list_share
keywords: qq, qq_cli, smb_list_share
optional_options:
- alternate: []
  help: ID of share to list.
  name: --id
  required: false
- alternate: []
  help: Name of share to list.
  name: --name
  required: false
- alternate: []
  help: ID of the tenant to get the share from. Only used if using the --name argument.
  name: --tenant-id
  required: false
- alternate: []
  help: Print the raw JSON response.
  name: --json
  required: false
permalink: /qq-cli-command-guide/smb/smb_list_share.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq smb_list_share</code> command.
synopsis: List a share
title: qq smb_list_share
usage: qq smb_list_share [-h] (--id ID | --name NAME) [--tenant-id TENANT_ID] [--json]
zendesk_source: qq CLI Command Guide

---