---
category: smb
command: smb_mod_share_permissions
keywords: qq, qq_cli, smb_mod_share_permissions
optional_options:
- alternate: []
  help: The ID of the share to modify.
  name: --id
  required: false
- alternate: []
  help: The name of the share to modify.
  name: --name
  required: false
- alternate: []
  help: "\n                The ID of the tenant from which to delete the share. Use\
    \ this flag only if you also\n                use the --name flag.\n         \
    \       "
  name: --tenant-id
  required: false
- alternate: []
  help: Print the raw JSON response.
  name: --json
  required: false
permalink: /qq-cli-command-guide/smb/smb_mod_share_permissions.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq smb_mod_share_permissions</code>
  command.
synopsis: Modify a share's permissions
title: qq smb_mod_share_permissions
usage: "qq smb_mod_share_permissions [-h] (--id ID | --name NAME) [--tenant-id TENANT_ID]\
  \ [--json]\n    {add_entry,remove_entry,modify_entry,replace} ..."

---