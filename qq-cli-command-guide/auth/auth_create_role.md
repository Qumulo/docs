---
category: auth
command: auth_create_role
optional_options:
- alternate:
  - --role
  help: Name of the role to create
  name: -r
  required: true
- alternate:
  - --description
  help: Description of the new role
  name: -d
  required: false
- alternate:
  - --privileges-file
  help: File with privileges for the role (see auth_list_privileges)
  name: -p
  required: false
permalink: /qq-cli-command-guide/auth/auth_create_role.html
positional_options: []
sidebar: qq_cli_command_reference_sidebar
summary: This section explains how to use the <code>qq auth_create_role</code> command.
synopsis: Create a custom role.
title: qq auth_create_role
usage: qq auth_create_role [-h] -r ROLE [-d DESCRIPTION] [-p PRIVILEGES_FILE]
zendesk_source: qq CLI Command Guide

---
For more information, see:
* {{site.xref.adminANQ.manageRBAC}}
* {{site.xref.adminOnPrem.manageRBAC}}

## Examples

## To Create a New Custom Qumulo Core Role
Run the `qq auth_create_role` command and specify the custom role name, description, and the file that lists the necessary privileges. For example:

```bash
qq auth_create_role \
  --role "SMB-Manager" \
  --description "Manage SMB Shares" \
  --privileges-file privileges.txt
```

{% include content-reuse/cli-guide/add-multiple-privileges-to-new-custom-role.md %}
