---
category: auth
command: auth_modify_role
optional_options:
- alternate:
  - --role
  help: Name of the role to modify
  name: -r
  required: true
- alternate:
  - --description
  help: New description of the role
  name: -d
  required: false
- alternate:
  - --privileges-file
  help: Overwrite the role's privileges with output from auth_list_privileges, cannot
    be used with -G or -R
  name: -p
  required: false
- alternate:
  - --grant
  help: Privilege to add to this role (may be repeated)
  name: -G
  required: false
- alternate:
  - --revoke
  help: Privilege to remove from this role (may be repeated)
  name: -R
  required: false
permalink: /qq-cli-command-guide/auth/auth_modify_role.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq auth_modify_role</code> command.
synopsis: Modify a custom role.
title: qq auth_modify_role
usage: qq auth_modify_role [-h] -r ROLE [-d DESCRIPTION] [-p PRIVILEGES_FILE] [-G
  PRIVILEGE [PRIVILEGE ...]] [-R PRIVILEGE [PRIVILEGE ...]]
zendesk_source: qq CLI Command Guide

---
For more information, see {{site.xref.adminOnPrem.manageRBAC}}.

## Examples

### To Add a Privilege to an Existing Custom Qumulo Core Role
Run the `qq auth_modify_role` command and specify the custom role name and the privilege to add. For example:

```bash
qq auth_modify_role \
  -r SMB-Manager \
  -G PRIVILEGE_SMB_SHARE_READ \
```
